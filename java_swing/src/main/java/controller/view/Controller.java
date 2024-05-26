package controller.view;

import controller.factory.DAOFactory;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import view.PanelClientes;
import view.Vista;
import view.PanelReservas;

/**
 * Controlador para la aplicación de gestión de una empresa de rutas enoturísticas.
 * Maneja la lógica de negocio y la interacción entre la vista y el modelo.
 * 
 * @autor Lucía Méndez Rodríguez
 */
public class Controller implements ActionListener {
    Vista vista = new Vista(); // Instancia de la vista principal
    PanelReservas panelReservas; // Panel para la gestión de reservas
    PanelClientes panelClientes; // Panel para la gestión de clientes
    DAOFactory SQLplusFactory = DAOFactory.getDAOFactory(DAOFactory.ORACLE); // Instancia de la fábrica de DAO para SQLPlus
    ControllerPanelClientes controllerPanelClientes; // Controlador para el panel de clientes
    ControllerPanelReservas controllerPanelReservas; // Controlador para el panel de reservas

    /**
     * Constructor del controlador.
     * @param v La vista principal de la aplicación.
     */
    public Controller(Vista v) {
        this.vista = v;
        
        // Registrar los listeners para los botones y acciones en la vista.
        this.vista.addListenerMenuReservas((ActionEvent e) -> {
            cargarPanelReservas();
        });
        
        this.vista.addMenuClientesListener((ActionEvent e) -> {
            cargarPanelClientes();
        });

        // Registrar un shutdown hook para cerrar las conexiones al finalizar la aplicación.
        Runtime.getRuntime().addShutdownHook(new Thread(() -> {
            try {
                SQLplusFactory.shutdown();
                System.out.println("Conexiones cerradas correctamente.");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }));
    }
        
    /**
     * Inicializa la vista y carga la lista de clientes.
     */
    public void iniciar() {
        this.panelClientes = new PanelClientes(); // Inicializar panel de clientes
        this.vista.cargarCentro(panelClientes); // Cargar panel de clientes en la vista
        this.controllerPanelClientes = new ControllerPanelClientes(panelClientes, this.SQLplusFactory); // Inicializar controlador de panel de clientes
        controllerPanelClientes.iniciar(); // Iniciar el controlador de panel de clientes
    }
        
    @Override
    public void actionPerformed(ActionEvent e) {
        // No se utiliza, cada botón tiene su propio ActionListener
    }
  
    /**
     * Método para cargar el panel de reservas.
     */
    private void cargarPanelReservas() {
        if (panelReservas == null) {
            this.panelReservas = new PanelReservas(); // Inicializar panel de reservas si es nulo
            controllerPanelReservas= new ControllerPanelReservas(panelReservas, SQLplusFactory); // Inicializar controlador de panel de reservas
        }
        controllerPanelReservas.iniciar(); // Iniciar el controlador de panel de reservas
        vista.cargarCentro(panelReservas); // Cargar el panel de reservas en la vista
    }

    /**
     * Método para cargar el panel de clientes.
     */
    private void cargarPanelClientes() {
        controllerPanelClientes.iniciar(); // Iniciar el controlador de panel de clientes
        vista.cargarCentro(panelClientes); // Cargar el panel de clientes en la vista
    }   
}
