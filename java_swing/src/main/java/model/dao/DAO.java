package model.dao;

import java.sql.Connection;
import java.util.List;

/**
 * Interfaz DAO (Data Access Object) que define las operaciones básicas de
 * persistencia para una entidad genérica T.
 * 
 * @param <T> el tipo de la entidad con la que trabaja el DAO.
 * @autor Lucia Méndez Rodríguez
 */
public interface DAO<T> {

    /**
     * Obtiene una lista de todas las entidades de tipo T.
     * 
     * @param conn la conexión a la base de datos.
     * @return una lista de todas las entidades de tipo T.
     */
    public List<T> getAll(Connection conn);
    /**
     * Agrega una nueva entidad de tipo T a la base de datos.
     * 
     * @param t la entidad a agregar.
     * @param conn la conexión a la base de datos.
     * @return true si se añade el objeto con éxito, false en caso contrario.
     */
    
    public boolean add(T t, Connection conn);

    /**
     * Actualiza una entidad existente en la base de datos.
     * 
     * @param t la entidad a actualizar.
     * @param conn la conexión a la base de datos.
     * @return true si la actualización fue exitosa, false en caso contrario.
     */
    public boolean update(T t, Connection conn);

    /**
     * Elimina una entidad de tipo T de la base de datos.
     * 
     * @param id la entidad a eliminar.
     * @param conn la conexión a la base de datos.
     * @return true si la eliminación fue exitosa, false en caso contrario.
     */
    public boolean deleteByID(String id, Connection conn);
    
    /**
     * Método para buscar una entidad T de la base de datos por su Id.
     *
     * @param termino del cliente a buscar.
     * @param conn La conexión a la base de datos.
     * @return T Devuelve la entidad encontrada.
     */
    public T findById(String termino, Connection conn);
}