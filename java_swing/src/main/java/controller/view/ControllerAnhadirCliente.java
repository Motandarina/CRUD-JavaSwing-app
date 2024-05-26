package controller.view;

import controller.factory.DAOFactory;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import javax.swing.JOptionPane;
import model.dao.ClienteDAO;
import model.vo.Cliente;
import view.VentanaAnhadirCliente;

/**
 * Controlador para añadir clientes a la base de datos.
 * Maneja la lógica de interacción entre la vista y el modelo.
 * Implementa ActionListener para escuchar eventos de los botones en la interfaz de usuario.
 */
public class ControllerAnhadirCliente implements ActionListener {
    VentanaAnhadirCliente ventanaAC; // Referencia a la ventana de añadir cliente
    DAOFactory SQLplusFactory = DAOFactory.getDAOFactory(DAOFactory.ORACLE); // Factoría para obtener objetos DAO
    ClienteDAO clienteDAO = SQLplusFactory.getClienteDAO(); // Objeto DAO para interactuar con la tabla de clientes
    Connection conn; // Conexión a la base de datos

    /**
     * Constructor del controlador.
     * Configura los listeners para los botones de la ventana de añadir cliente.
     * @param vista La ventana de añadir cliente.
     */
    public ControllerAnhadirCliente(VentanaAnhadirCliente vista) {
        this.ventanaAC = vista;
        // Configuración de listeners para los botones
        vista.addConfirmarClienteListener((ActionEvent e) -> {
            if(vista.checkFields()) {
            anhadirCliente(); }// Llama al método para añadir un cliente
        });
        vista.addCancelarClienteListener((ActionEvent e) -> {
            vista.dispose(); // Cierra la ventana de añadir cliente
        });
        vista.setVisible(true); // Hace visible la ventana
    }

    /**
     * Método para añadir un nuevo cliente a la base de datos.
     */
    private void anhadirCliente() {
        try {
            String idCliente = ventanaAC.getId(); // Obtiene el ID del cliente desde la vista
            conn = SQLplusFactory.getConnection(); // Obtiene una conexión a la base de datos
            
            // Verifica si el cliente ya existe en la base de datos
            if (clienteDAO.findById(idCliente, conn) == null) {
                // Si el cliente no existe, crea un nuevo objeto Cliente y lo añade a la base de datos
                Cliente cliente = new Cliente();
                cliente.setId(ventanaAC.getId());
                cliente.setNombre(ventanaAC.getNombre());
                cliente.setApellidos(ventanaAC.getApellidos());
                cliente.setTelefono(ventanaAC.getTelefono());
                cliente.setEmail(ventanaAC.getEmail());
                cliente.setDireccion(ventanaAC.getDireccion());
                boolean success = clienteDAO.add(cliente, conn); // Añade el cliente a la base de datos
                SQLplusFactory.releaseConnection(conn); // Libera la conexión
                if (success){
                JOptionPane.showMessageDialog(ventanaAC, "Cliente con ID "
                        + cliente.getId() + " añadido.",
                        "Añadir cliente", JOptionPane.INFORMATION_MESSAGE);
                ventanaAC.dispose(); // Cierra la ventana de añadir cliente
                } else {
                JOptionPane.showMessageDialog(ventanaAC, "Cliente con ID "
                        + cliente.getId() + " no añadido.",
                        "Añadir cliente", JOptionPane.ERROR_MESSAGE);
            }
            } else {
                // Si el cliente ya existe, muestra un mensaje de error
                JOptionPane.showMessageDialog(ventanaAC,
                        "Ya existe un cliente con ID "
                        + idCliente + ".",
                        "Añadir cliente", JOptionPane.ERROR_MESSAGE);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Imprime el error en la consola
            JOptionPane.showMessageDialog(ventanaAC, "Error al añadir cliente",
                    "Error", JOptionPane.ERROR_MESSAGE); // Muestra un mensaje de error
        }
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        // No se utiliza, cada botón tiene su propio ActionListener
    }
}
