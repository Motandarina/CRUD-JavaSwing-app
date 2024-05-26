package controller.pool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * BasicConnectionPool es una implementación simple de un pool de conexiones.
 * Gestiona un pool de conexiones a una base de datos para reutilizarlas, lo que ayuda a reducir el tiempo de establecimiento de una nueva conexión cada vez que se necesita una.
 * Esta clase implementa la interfaz ConnectionPool.
 * 
 * @autor Lucía Méndez Rodríguez
 */
public class BasicConnectionPool implements ConnectionPool {

    private static final int MAX_POOL_SIZE = 10;
    private static final int MAX_TIMEOUT = 1000;
    private String url;
    private String user;
    private String password;
    private List<Connection> connectionPool;
    private List<Connection> usedConnections = new ArrayList<>();
    private static int INITIAL_POOL_SIZE = 10;
    private BasicConnectionPool bcp = null;

    /**
     * Constructor privado para crear una instancia de BasicConnectionPool.
     * 
     * @param url La URL de la base de datos.
     * @param user El nombre de usuario para la conexión.
     * @param password La contraseña para la conexión.
     * @param pool La lista de conexiones disponibles en el pool.
     */
    private BasicConnectionPool(String url, String user, String password, List<Connection> pool) {
        this.url = url;
        this.user = user;
        this.password = password;
        this.connectionPool = pool;
    }

    /**
     * Crea una instancia de BasicConnectionPool con un conjunto inicial de conexiones.
     * 
     * @param url La URL de la base de datos.
     * @param user El nombre de usuario para la conexión.
     * @param password La contraseña para la conexión.
     * @return Una instancia de BasicConnectionPool.
     * @throws SQLException Si ocurre un error al crear las conexiones.
     */
    public static BasicConnectionPool create(String url, String user, String password) throws SQLException {
        List<Connection> pool = new ArrayList<>(INITIAL_POOL_SIZE);
        for (int i = 0; i < INITIAL_POOL_SIZE; i++) {
            pool.add(createConnection(url, user, password));
        }
        return new BasicConnectionPool(url, user, password, pool);
    }

    /**
     * Crea una nueva conexión a la base de datos.
     * 
     * @param url La URL de la base de datos.
     * @param user El nombre de usuario para la conexión.
     * @param password La contraseña para la conexión.
     * @return Una nueva conexión a la base de datos.
     * @throws SQLException Si ocurre un error al crear la conexión.
     */
    private static Connection createConnection(String url, String user, String password) throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

    /**
     * Obtiene el tamaño total del pool de conexiones, incluyendo las usadas y las disponibles.
     * 
     * @return El tamaño del pool de conexiones.
     */
    public int getSize() {
        return connectionPool.size() + usedConnections.size();
    }

    /**
     * Cierra todas las conexiones en el pool y vacía el pool.
     * 
     * @throws SQLException Si ocurre un error al cerrar las conexiones.
     */
    public void shutdown() throws SQLException {
        for (Connection c : connectionPool) {
            c.close();
        }
        connectionPool.clear();
    }

    /**
     * Obtiene una conexión del pool. Si no hay conexiones disponibles, se crea una nueva conexión si no se ha alcanzado el tamaño máximo del pool.
     * 
     * @return Una conexión disponible del pool.
     * @throws SQLException Si ocurre un error al obtener o crear una conexión.
     */
    @Override
    public Connection getConnection() throws SQLException {
        if (connectionPool.isEmpty()) {
            if (usedConnections.size() < MAX_POOL_SIZE) {
                connectionPool.add(createConnection(url, user, password));
            } else {
                throw new RuntimeException("Se alcanzó el tamaño máximo del pool, ¡no hay conexiones disponibles!");
            }
        }

        Connection connection = connectionPool.remove(connectionPool.size() - 1);

        if (!connection.isValid(MAX_TIMEOUT)) {
            connection = createConnection(url, user, password);
        }

        usedConnections.add(connection);
        return connection;
    }

    /**
     * Libera una conexión devolviéndola al pool de conexiones disponibles.
     * 
     * @param connection La conexión a liberar.
     * @return true si la conexión fue liberada con éxito, false en caso contrario.
     */
    @Override
    public boolean realeseConection(Connection connection) {
        connectionPool.add(connection);
        return usedConnections.remove(connection);
    }

    /**
     * Obtiene la URL de la base de datos.
     * 
     * @return La URL de la base de datos.
     */
    @Override
    public String getUrl() {
        // TODO Implementar este método
        return null;
    }

    /**
     * Obtiene el nombre de usuario de la conexión.
     * 
     * @return El nombre de usuario.
     */
    @Override
    public String getUser() {
        // TODO Implementar este método
        return null;
    }

    /**
     * Obtiene la contraseña de la conexión.
     * 
     * @return La contraseña.
     */
    @Override
    public String getPassword() {
        // TODO Implementar este método
        return null;
    }
}
