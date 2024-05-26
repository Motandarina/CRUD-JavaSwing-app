package controller.pool;

import java.sql.Connection;
import java.sql.SQLException;

/**
 *
 * @author Lucía Méndez Rodríguez
 */
public interface ConnectionPool {    
    Connection getConnection() throws SQLException;
    boolean realeseConection(Connection connection);
    String getUrl();
    String getUser();
    String getPassword();    
}
