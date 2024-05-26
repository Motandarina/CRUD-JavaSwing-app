package controller.view;

import controller.factory.DAOFactory;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.util.List;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import static javax.swing.SwingUtilities.getWindowAncestor;
import javax.swing.table.DefaultTableModel;
import model.dao.ClienteDAO;
import model.vo.Cliente;
import view.PanelClientes;
import view.VentanaAnhadirCliente;

/**
 *
 * @author Lucía Méndez Rodríguez
 */
public class ControllerPanelClientes implements ActionListener {

    static List<Cliente> clientes;
    PanelClientes panelClientes;
    DefaultTableModel modeloTabla = new DefaultTableModel();
    DAOFactory SQLplusFactory;
    ClienteDAO clienteDAO;
    Connection conn;

    ControllerPanelClientes(PanelClientes panelClientes,
            DAOFactory SQLPlusFactory) {
        this.panelClientes = panelClientes;
        this.SQLplusFactory = DAOFactory.getDAOFactory(DAOFactory.ORACLE);
        this.clienteDAO = SQLplusFactory.getClienteDAO();
        panelClientes.addBuscarClientes((ActionEvent e) -> {
            buscarCliente();
        });
        this.panelClientes.addAnhadirClienteListener((ActionEvent e) -> {
            abrirVentanaAnhadirCliente();
        });
        this.panelClientes.addEditarClienteListener((ActionEvent e) -> {
            activarEdicionCliente(true);
        });
        this.panelClientes.addOKEditarClienteListener((ActionEvent e) -> {
            if (panelClientes.checkFields()) {
                editarCliente();
            } else {activarEdicionCliente(false);}
        });
        this.panelClientes.addEliminarClienteListener((ActionEvent e) -> {
            eliminarCliente();
        });

        // Registrar un listener para la selección de filas en la tabla de clientes.
        this.panelClientes.getTableClientes().getSelectionModel().
                addListSelectionListener(e -> {
                    int selectedRow = panelClientes.getTableClientes().
                            getSelectedRow();
                    if (selectedRow != -1) {
                        setTxtFieldWithRowSelected(selectedRow);
                    }
                });
    }

    /**
     * Lista todos los clientes y los muestra en la tabla de panelClientes.
     */
    private void listarClientes() {
        try {
            cleanTable();
            conn = SQLplusFactory.getConnection();
            clientes = clienteDAO.getAll(conn);
            SQLplusFactory.releaseConnection(conn);
            for (Cliente cliente : clientes) {
                modeloTabla.addRow(new Object[]{
                    cliente.getId(),
                    cliente.getNombre(),
                    cliente.getApellidos(),
                    cliente.getTelefono(),
                    cliente.getEmail(),
                    cliente.getDireccion()
                });
            }

        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(panelClientes,
                    "Error al listar clientes",
                    "Error", JOptionPane.ERROR_MESSAGE);
        }
        panelClientes.detenerFiltro();
        panelClientes.setVisibleButtonEditarCliente(false);
        panelClientes.setVisibleButtonEditarCliente(true);
    }

    /**
     * Edita la información de un cliente y la actualiza en la base de datos.
     */
    private void editarCliente() {
        try {
            Cliente cliente = new Cliente();
            cliente.setId(panelClientes.getId());
            cliente.setNombre(panelClientes.getNombre());
            cliente.setApellidos(panelClientes.getApellidos());
            cliente.setTelefono(panelClientes.getTelefono());
            cliente.setEmail(panelClientes.getEmail());
            cliente.setDireccion(panelClientes.getDireccion());
            conn = SQLplusFactory.getConnection();
            boolean success = clienteDAO.update(cliente, conn);
            SQLplusFactory.releaseConnection(conn);
            if (success) {
                JOptionPane.showMessageDialog(panelClientes, "Cliente con ID "
                        + cliente.getId() + " editado.",
                        "Editar cliente", JOptionPane.INFORMATION_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(panelClientes, "Cliente con ID "
                        + cliente.getId() + " no editado.",
                        "Editar cliente", JOptionPane.INFORMATION_MESSAGE);
            }
            listarClientes();
            activarEdicionCliente(false);
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(panelClientes,
                    "Error al editar cliente",
                    "Error", JOptionPane.ERROR_MESSAGE);
        }
        panelClientes.setVisibleButtonOKEdicionCliente(false);
        panelClientes.setVisibleButtonEditarCliente(true);
    }

    /**
     * Elimina un cliente de la base de datos.
     */
    private void eliminarCliente() {
        try {
            String id = panelClientes.getId();
            conn = SQLplusFactory.getConnection();
            int response = JOptionPane.showConfirmDialog(
                    panelClientes,
                    "¿Quieres eliminar al cliente con id " + id + "?",
                    "Confirmar",
                    JOptionPane.OK_CANCEL_OPTION,
                    JOptionPane.QUESTION_MESSAGE
            );
            if (response == JOptionPane.OK_OPTION) {
                boolean b = clienteDAO.deleteByID(id, conn);
                SQLplusFactory.releaseConnection(conn);
                if (b) {
                    JOptionPane.showMessageDialog(panelClientes,
                            "Cliente con ID " + id + " borrado.",
                            "Borrar cliente", JOptionPane.INFORMATION_MESSAGE);
                } else {
                    JOptionPane.showMessageDialog(panelClientes,
                            "No se ha podido borrar al cliente con id " + id,
                            "Cancelado", JOptionPane.ERROR_MESSAGE);
                }
            } else if (response == JOptionPane.CANCEL_OPTION) {
                JOptionPane.showMessageDialog(panelClientes, "Cancelado",
                        "Borrar cliente", JOptionPane.INFORMATION_MESSAGE);
            }
            listarClientes(); // Actualizar la tabla después de eliminar
            setTxtFieldWithRowSelected(0);
        } catch (Exception e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(panelClientes,
                    "Error al eliminar cliente",
                    "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void buscarCliente() {
        /* try {
        String id = panelClientes.getTxtFieldBuscar();
        conn = SQLplusFactory.getConnection();
        clientes = clienteDAO.getAll(conn);
        SQLplusFactory.releaseConnection(conn);
        Cliente c = clienteDAO.findById(id, conn);
        if (c != null) {
        setTxtFieldsCliente(c);
        } else {
        JOptionPane.showMessageDialog(panelClientes, "Cliente no encontrado",
        "Buscar cliente", JOptionPane.INFORMATION_MESSAGE);
        }
        
        } catch (Exception e) {
        e.printStackTrace();
        JOptionPane.showMessageDialog(panelClientes, "Error al buscar cliente",
        "Error", JOptionPane.ERROR_MESSAGE);
        }*/

        panelClientes.filtrar();
    }

    /**
     * Inicializa la panelClientes y carga la lista de clientes.
     */
    public void iniciar() {
        modeloTabla = (DefaultTableModel) panelClientes.getTableClientes().
                getModel();
        cleanTable();
        listarClientes();
        setTxtFieldWithRowSelected(0);
    }

    /**
     * Limpia la tabla de clientes.
     */
    private void cleanTable() {
        modeloTabla.setRowCount(0);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        // No se utiliza, cada botón tiene su propio ActionListener
    }

    /**
     * Establece los campos de texto con los datos del cliente seleccionado en
     * la tabla.
     *
     * @param selectedRow La fila seleccionada en la tabla.
     */
    private void setTxtFieldWithRowSelected(int selectedRow) {
        Cliente cliente = new Cliente();
        cliente.setId((String) modeloTabla.getValueAt(selectedRow, 0));
        cliente.setNombre((String) modeloTabla.getValueAt(selectedRow, 1));
        cliente.setApellidos((String) modeloTabla.getValueAt(selectedRow, 2));
        cliente.setTelefono((String) modeloTabla.getValueAt(selectedRow, 3));
        cliente.setEmail((String) modeloTabla.getValueAt(selectedRow, 4));
        cliente.setDireccion((String) modeloTabla.getValueAt(selectedRow, 5));
        setTxtFieldsCliente(cliente);
    }

    /**
     * Establece los campos de texto con los datos de un cliente.
     *
     * @param c El cliente cuyos datos se establecerán en los campos de texto.
     */
    private void setTxtFieldsCliente(Cliente c) {
        panelClientes.getTextFieldID().setText(c.getId());
        panelClientes.getTextFieldNombre().setText(c.getNombre());
        panelClientes.getTextFieldApellidos().setText(c.getApellidos());
        panelClientes.getTextFieldTlf().setText(c.getTelefono());
        panelClientes.getTextFieldEmail().setText(c.getEmail());
        panelClientes.getTextFieldDir().setText(c.getDireccion());
    }

    /**
     * Activa o desactiva la edición de los campos de texto de un cliente.
     *
     * @param activar true para activar la edición, false para desactivarla.
     */
    private void activarEdicionCliente(boolean activar) {
        panelClientes.getTextFieldNombre().setEditable(activar);
        panelClientes.getTextFieldApellidos().setEditable(activar);
        panelClientes.getTextFieldTlf().setEditable(activar);
        panelClientes.getTextFieldEmail().setEditable(activar);
        panelClientes.getTextFieldDir().setEditable(activar);
        panelClientes.setVisibleButtonOKEdicionCliente(activar);
        panelClientes.setVisibleButtonEditarCliente(!activar);
    }

    /**
     * Abre la ventana para añadir un nuevo cliente.
     */
    private void abrirVentanaAnhadirCliente() {
        JFrame frame = (JFrame) getWindowAncestor(panelClientes);
        VentanaAnhadirCliente ventanaAC = new VentanaAnhadirCliente(
                frame, true);
        ventanaAC.setLocationRelativeTo(panelClientes);
        ControllerAnhadirCliente controllerCliente
                = new ControllerAnhadirCliente(ventanaAC);
        iniciar();
    }

}
