package controller.view;

import static controller.view.ControllerPanelReservas.reservas;

import controller.factory.DAOFactory;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import model.dao.ReservaDAO;
import model.vo.Reserva;
import view.PanelReservas;

/**
 * ControllerPanelReservas se encarga de manejar las interacciones del usuario con el panel de reservas.
 * Interactúa con el ReservaDAO para realizar operaciones CRUD y actualiza la interfaz gráfica en consecuencia.
 * 
 * @see ActionListener
 * @see ReservaDAO
 * @see PanelReservas
 */
public class ControllerPanelReservas implements ActionListener {

    static List<Reserva> reservas;
    PanelReservas panelReservas;
    DefaultTableModel modeloTabla = new DefaultTableModel();
    DAOFactory SQLplusFactory;
    ReservaDAO reservaDAO;
    Connection conn;

    /**
     * Constructor de la clase ControllerPanelReservas.
     *
     * @param panelReservas El panel donde se muestran y gestionan las reservas.
     * @param SQLPlusFactory La fábrica utilizada para crear objetos DAO.
     */
    ControllerPanelReservas(PanelReservas panelReservas, DAOFactory SQLPlusFactory) {
        this.panelReservas = panelReservas;
        this.SQLplusFactory = DAOFactory.getDAOFactory(DAOFactory.ORACLE);
        this.reservaDAO = SQLplusFactory.getReservaDAO();

        // Registrar la acción de búsqueda
        panelReservas.addBuscarReservas((ActionEvent e) -> {
            buscarReserva();
        });

        // Registrar un listener para la selección de filas en la tabla de reservas
        this.panelReservas.getTableReservas().getSelectionModel().addListSelectionListener(e -> {
            int selectedRow = panelReservas.getTableReservas().getSelectedRow();
            if (selectedRow != -1) {
                setTxtFieldWithRowSelected(selectedRow);
            }
        });
    }

    /**
     * Lista todas las reservas y las muestra en la tabla del panel.
     */
    private void listarReservas() {
        try {
            cleanTable();
            conn = SQLplusFactory.getConnection();
            reservas = reservaDAO.getAll(conn);
            SQLplusFactory.releaseConnection(conn);
            for (Reserva reserva : reservas) {
                modeloTabla.addRow(new Object[]{
                    reserva.getNumeroReserva(),
                    reserva.getNombreRuta(),
                    reserva.getFechaHoraRuta(),
                    reserva.getClienteRuta(),
                    reserva.getNumeroPersonas(),
                    reserva.getEstado(),
                    reserva.getImporte()
                });
            }

        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(panelReservas, "Error al listar reservas", "Error", JOptionPane.ERROR_MESSAGE);
        }
        panelReservas.detenerFiltro();
    }

    /**
     * Filtra las reservas según los criterios especificados por el usuario.
     */
    private void buscarReserva() {
        panelReservas.filtrar();
    }

    /**
     * Inicializa el panel y carga la lista de reservas.
     */
    public void iniciar() {
        modeloTabla = (DefaultTableModel) panelReservas.getTableReservas().getModel();
        cleanTable();
        listarReservas();
        setTxtFieldWithRowSelected(0);
    }

    /**
     * Limpia todas las filas de la tabla de reservas.
     */
    private void cleanTable() {
        modeloTabla.setRowCount(0);
    }

    /**
     * Rellena los campos de texto con los datos de la fila seleccionada en la tabla de reservas.
     *
     * @param selectedRow El índice de la fila seleccionada en la tabla.
     */
    private void setTxtFieldWithRowSelected(int selectedRow) {
        // Obtener valores de la fila seleccionada
        int numeroReserva = (Integer) modeloTabla.getValueAt(selectedRow, 0);
        String clienteRuta = (String) modeloTabla.getValueAt(selectedRow, 3);
        String nombreRuta = (String) modeloTabla.getValueAt(selectedRow, 1);
        LocalDateTime fechaHoraRuta = (LocalDateTime) modeloTabla.getValueAt(selectedRow, 2);
        int numeroPersonas = (Integer) modeloTabla.getValueAt(selectedRow, 4);
        String estado = (String) modeloTabla.getValueAt(selectedRow, 5);
        double importe = (Double) modeloTabla.getValueAt(selectedRow, 6);

        // Crear una instancia de Reserva con los valores obtenidos
        Reserva reserva = new Reserva(numeroReserva, clienteRuta, nombreRuta, fechaHoraRuta, numeroPersonas, estado, importe);
        setTxtFieldsReserva(reserva);
    }

    /**
     * Crea un objeto Reserva a partir de los datos en la fila seleccionada de la tabla.
     *
     * @param selectedRow El índice de la fila seleccionada en la tabla.
     * @return Un objeto Reserva que contiene los datos de la fila seleccionada.
     */
    private Reserva getReservaRowSelected(int selectedRow) {
        int numeroReserva = (Integer) modeloTabla.getValueAt(selectedRow, 0);
        String clienteRuta = (String) modeloTabla.getValueAt(selectedRow, 3);
        String nombreRuta = (String) modeloTabla.getValueAt(selectedRow, 1);
        LocalDateTime fechaHoraRuta = (LocalDateTime) modeloTabla.getValueAt(selectedRow, 2);
        int numeroPersonas = (Integer) modeloTabla.getValueAt(selectedRow, 4);
        String estado = (String) modeloTabla.getValueAt(selectedRow, 5);
        double importe = (Double) modeloTabla.getValueAt(selectedRow, 6);

        return new Reserva(numeroReserva, clienteRuta, nombreRuta, fechaHoraRuta, numeroPersonas, estado, importe);
    }

    /**
     * Establece los campos de texto con los datos de un objeto Reserva dado.
     *
     * @param r El objeto Reserva cuyos datos se establecerán en los campos de texto.
     */
    private void setTxtFieldsReserva(Reserva r) {
        DateTimeFormatter formateador = DateTimeFormatter.ofPattern("dd-MM-yy HH:MM");
        String fechaHoraRuta = r.getFechaHoraRuta().format(formateador);

        panelReservas.getTextFieldIDReserva().setText(String.valueOf(r.getNumeroReserva()));
        panelReservas.getTextFieldNombreRuta().setText(r.getNombreRuta());
        panelReservas.getTextFieldClienteRuta().setText(r.getClienteRuta());
        panelReservas.getTextFieldEstado().setText(r.getEstado());
        panelReservas.getTextFieldFecha().setText(fechaHoraRuta); // Convertir LocalDateTime a String
        panelReservas.getTextFieldImporte().setText(String.valueOf(r.getImporte()) + "€"); // Convertir double a String
        panelReservas.getTextFieldNumPersonas().setText(String.valueOf(r.getNumeroPersonas())); // Convertir int a String
    }

    /**
     * Maneja los eventos de acción disparados por el usuario.
     *
     * @param e El evento de acción a manejar.
     */
    @Override
    public void actionPerformed(ActionEvent e) {
        // Implementación para manejar eventos de acción puede ser añadida aquí.
    }
}
