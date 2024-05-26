package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.vo.Cliente;

/**
 * Clase que implementa las operaciones de acceso a datos para la entidad
 * Cliente. Esta clase proporciona métodos para realizar operaciones CRUD
 * (Crear, Leer, Actualizar, Borrar) sobre la tabla 'clientes' en la base de
 * datos.
 *
 * @author Lucía Méndez Rodríguez
 */
public class ClienteDAO implements DAO<Cliente> {

    PreparedStatement ps; // Objeto para ejecutar consultas preparadas

    /**
     * Constructor por defecto que inicializa el PreparedStatement.
     */
    public ClienteDAO() {
        ps = null;
    }

    /**
     * Método para obtener todos los clientes de la base de datos.
     *
     * @param conn La conexión a la base de datos.
     * @return Una lista de objetos Cliente que representan todos los clientes
     * en la base de datos.
     */
    @Override
    public List<Cliente> getAll(Connection conn) {
        List<Cliente> lista = null; // Lista para almacenar los clientes recuperados de la base de datos
        try {
            String query = "SELECT * FROM clientes"; // Consulta SQL para seleccionar todos los clientes
            // Preparar la consulta con tipo de ResultSet y concurrencia específicos
            ps = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = ps.executeQuery(); // Ejecutar la consulta y obtener el resultado
            lista = new ArrayList<>(); // Inicializar la lista
            // Recorrer el resultado y crear objetos Cliente para cada registro
            while (rs.next()) {
                String id = rs.getString(1);
                String nombre = rs.getString(2);
                String apellidos = rs.getString(3);
                String telefono = rs.getString(4);
                String email = rs.getString(5);
                String direccion = rs.getString(6);
                lista.add(new Cliente(id, nombre, apellidos, telefono, email,
                        direccion)); // Agregar el cliente a la lista
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista; // Devolver la lista de clientes
    }

    /**
     * Método para agregar un nuevo cliente a la base de datos.
     *
     * @param cliente El cliente a agregar.
     * @param conn La conexión a la base de datos.
     * @return true Si se añade con éxito al cliente, false enc aso contrario.
     */
    @Override
    public boolean add(Cliente cliente, Connection conn) {
        boolean success = false; 
        try {
            String query = "INSERT INTO clientes VALUES (?, ?, ?, ?, ?, ?)"; // Consulta SQL para insertar un cliente
            ps = conn.prepareStatement(query); // Preparar la consulta
            // Establecer los parámetros de la consulta con los datos del cliente
            ps.setString(1, cliente.getId());
            ps.setString(2, cliente.getNombre());
            ps.setString(3, cliente.getApellidos());
            ps.setString(4, cliente.getTelefono());
            ps.setString(5, cliente.getEmail());
            ps.setString(6, cliente.getDireccion());
            ps.executeUpdate();
            success = true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    /**
     * Método para actualizar un cliente en la base de datos.
     *
     * @param cliente El cliente con los datos actualizados.
     * @param conn La conexión a la base de datos.
     * @return true si la actualización fue exitosa, false de lo contrario.
     */
    @Override
    public boolean update(Cliente cliente, Connection conn) {
        boolean success = false; // Bandera para indicar si la actualización fue exitosa
        try {
            String query
                    = "UPDATE clientes SET nombre=?, apellidos=?, telefono=?, email=?, direccion=? WHERE id=?";
            ps = conn.prepareStatement(query); // Preparar la consulta
            // Establecer los parámetros de la consulta con los datos actualizados del cliente
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getApellidos());
            ps.setString(3, cliente.getTelefono());
            ps.setString(4, cliente.getEmail());
            ps.setString(5, cliente.getDireccion());
            ps.setString(6, cliente.getId());

            int rowsAffected = ps.executeUpdate(); // Ejecutar la consulta y obtener el número de filas afectadas
            // Verificar si la actualización fue exitosa
            if (rowsAffected > 0) {
                success = true; // Actualización exitosa
                //System.out.println("Actualización exitosa. Filas afectadas: "
                //+ rowsAffected);
            } else {
                //System.out.println("La actualización no afectó ninguna fila.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success; // Devolver el resultado de la actualización
    }

    /**
     * Método para eliminar un cliente de la base de datos.
     *
     * @param id Id del cliente a eliminar.
     * @param conn La conexión a la base de datos.
     * @return true si la eliminación fue exitosa, false de lo contrario.
     */
    @Override
    public boolean deleteByID(String id, Connection conn) {
        boolean success = false; // Bandera para indicar si la eliminación fue exitosa
        try {
            String query = "DELETE FROM clientes WHERE id=?"; // Consulta SQL para eliminar un cliente por su ID
            ps = conn.prepareCall(query); // Preparar la consulta
            // Establecer el parámetro de la consulta con el ID del cliente a eliminar
            ps.setString(1, id);
            int row = ps.executeUpdate(); // Ejecutar la consulta y obtener el número de filas afectadas
            // Verificar si la eliminación fue exitosa
            if (row > 0) {
                //System.out.println( "Se ha borrado " + row + " cliente"); // Imprimir mensaje de éxito
                success = true; // Eliminación exitosa
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success; // Devolver el resultado de la eliminación
    }

    /**
     * Método para buscar un cliente de la base de datos por su Id.
     *
     * @param id del cliente a buscar.
     * @param conn La conexión a la base de datos.
     * @return Cliente si lo encuentra, null de lo contrario.
     */
    @Override
    public Cliente findById(String id, Connection conn) {
        Cliente c = null;
        String terminoFormateado = id.trim().toLowerCase();
        try {
            String query
                    = "SELECT * FROM clientes where LOWER(id)=?";
            ps = conn.prepareStatement(query);
            ps.setString(1, terminoFormateado);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String nombre = rs.getString(2);
                String apellidos = rs.getString(3);
                String telefono = rs.getString(4);
                String email = rs.getString(5);
                String direccion = rs.getString(6);
                c = new Cliente(id, nombre, apellidos, telefono, email,
                        direccion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return c;
    }
}
