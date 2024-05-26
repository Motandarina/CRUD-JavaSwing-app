package controller.factory;

import controller.pool.BasicConnectionPool;
import java.sql.Connection;
import java.sql.SQLException;
import model.dao.ClienteDAO;
import model.dao.ReservaDAO;

/**
 * Clase que implementa la factoría abstracta para proporcionar objetos DAO 
 * y conexiones a la base de datos utilizando SQLPlus (Oracle).
 * 
 * @author Lucía Méndez Rodríguez
 */
public class OracleDAOFactory extends DAOFactory {
    // Constantes para la URL de conexión, nombre de usuario y contraseña
    final static String URL = "jdbc:oracle:thin:@//localhost:1521/XE";
    final static String USER = "c##admings";
    final static String PASSWORD = "1234";
    // Instancia de BasicConnectionPool para gestionar las conexiones
    static BasicConnectionPool bcp;

    /**
     * Constructor de la factoría que inicializa la conexión a la base de datos.
     */
    public OracleDAOFactory() {
        try {
            // Crear un BasicConnectionPool utilizando la URL, usuario y contraseña especificados
            bcp = BasicConnectionPool.create(URL, USER, PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }  
    
    /**
     * Método para obtener una conexión de la factoría.
     * 
     * @return Una conexión a la base de datos.
     * @throws SQLException Si hay un error al obtener la conexión.
     */
    @Override
    public Connection getConnection() throws SQLException {
        return bcp.getConnection(); // Obtener una conexión del pool
    }

    /**
     * Método para obtener un objeto ClienteDAO de la factoría.
     * 
     * @return Un objeto ClienteDAO para acceder a los datos de los clientes.
     */
    @Override
    public ClienteDAO getClienteDAO() {
        return new ClienteDAO(); // Crear un nuevo objeto ClienteDAO
    }
    
    /**
     * Método para obtener un objeto ReservaDAO de la factoría.
     * 
     * @return Un objeto RerservaDAO para acceder a los datos de las reservas.
     */
    @Override
    public ReservaDAO getReservaDAO() {
        return new ReservaDAO(); 
    }
    
    /**
     * Método para liberar una conexión de la factoría.
     * 
     * @param conn La conexión a liberar.
     * @return true si se liberó la conexión correctamente, false de lo contrario.
     */
    @Override
    public boolean releaseConnection(Connection conn) {
        return bcp.realeseConection(conn); // Liberar la conexión en el pool
    }
    
    /**
     * Método para obtener el tamaño actual del pool de conexiones.
     * 
     * @return El tamaño actual del pool de conexiones.
     */
    @Override
    public int getSize() {
        return bcp.getSize(); // Obtener el tamaño del pool de conexiones
    }
    
    /**
     * Método para apagar el pool de conexiones de la factoría.
     * 
     * @throws Exception Si hay un error al apagar el pool de conexiones.
     */
    @Override
    public void shutdown() throws Exception {
        bcp.shutdown(); // Apagar el pool de conexiones
    }
}
