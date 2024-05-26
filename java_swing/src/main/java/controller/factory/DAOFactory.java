package controller.factory;

import java.sql.Connection;
import model.dao.ClienteDAO;
import model.dao.ReservaDAO;

/**
 * Clase abstracta que representa una factoría de objetos DAO.
 * Define métodos abstractos para obtener conexiones y objetos DAO específicos.
 * Además, proporciona un método estático para obtener una instancia de la factoría.
 * 
 * @autor Lucía Méndez Rodríguez
 */
public abstract class DAOFactory {

    // Constantes que representan las diferentes factorías disponibles
    public static final int ORACLE = 1;

    // Métodos abstractos que deben ser implementados por las subclases
    public abstract Connection getConnection() throws Exception;

    public abstract ClienteDAO getClienteDAO();
    public abstract ReservaDAO getReservaDAO();

    // Método estático para obtener una instancia de la factoría según el tipo especificado
    public static DAOFactory getDAOFactory(int whichFactory) {
        switch (whichFactory) {
            case ORACLE:
                return new OracleDAOFactory(); // Crear una instancia de OracleDAOFactory
            default:
                return null; // Devolver null si el tipo de factoría no es válido
        }
    }

    // Métodos opcionales que pueden ser implementados por las subclases
    public boolean releaseConnection(Connection conn) {
        return false; // Liberar la conexión (opcional)
    }

    public int getSize() {
        return 0; // Obtener el tamaño del pool de conexiones (opcional)
    }

    public void shutdown() throws Exception {
        // Apagar la factoría (opcional)
    }
}
