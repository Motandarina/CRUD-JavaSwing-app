package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import model.vo.Reserva;

/**
 * ReservaDAO es la clase encargada de realizar operaciones CRUD para la entidad Reserva.
 * Implementa la interfaz DAO y proporciona métodos para obtener todas las reservas,
 * actualizar una reserva, entre otros.
 * 
 * @see DAO
 * @see Reserva
 * @see Connection
 */
public class ReservaDAO implements DAO<Reserva> {

    PreparedStatement ps;

    /**
     * Constructor por defecto de ReservaDAO.
     */
    public ReservaDAO() {
        ps = null;
    }

    /**
     * Obtiene todas las reservas de la base de datos.
     *
     * @param conn La conexión a la base de datos.
     * @return Una lista de objetos Reserva.
     */
    @Override
    public List<Reserva> getAll(Connection conn) {
        List<Reserva> lista = null;
        try {
            String query = "SELECT r.id, r.id_cliente, ru.nombre, r.fecha_hora_ruta, r.num_personas, r.estado, r.importe FROM reservas r INNER JOIN rutas ru ON r.id_ruta = ru.id";
            // Preparar la consulta con tipo de ResultSet y concurrencia específicos
            ps = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = ps.executeQuery(); // Ejecutar la consulta y obtener el resultado
            lista = new ArrayList<>(); // Inicializar la lista
            // Recorrer el resultado y crear objetos Reserva para cada registro
            while (rs.next()) {
                int numeroReserva = rs.getInt(1);
                String clienteRuta = rs.getString(2); 
                String nombreRuta = rs.getString(3);
                LocalDateTime fechaHoraRuta = rs.getTimestamp(4).toLocalDateTime();
                int numeroPersonas = rs.getInt(5);
                String estado = rs.getString(6);
                double importe = rs.getDouble(7);
                lista.add(new Reserva(numeroReserva, clienteRuta, nombreRuta, fechaHoraRuta, numeroPersonas, estado, importe)); // Agregar la reserva a la lista
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    /**
     * Agrega una nueva reserva a la base de datos.
     *
     * @param t La reserva a agregar.
     * @param conn La conexión a la base de datos.
     * @return true si la operación fue exitosa, false en caso contrario.
     */
    @Override
    public boolean add(Reserva t, Connection conn) {
        throw new UnsupportedOperationException("Not supported yet."); // Implementación pendiente
    }

    /**
     * Actualiza una reserva existente en la base de datos.
     *
     * @param reserva La reserva con los datos actualizados.
     * @param conn La conexión a la base de datos.
     * @return true si la operación fue exitosa, false en caso contrario.
     */
    @Override
    public boolean update(Reserva reserva, Connection conn) {
        boolean success = false;
        try {
            String query = "UPDATE reservas SET num_personas=?, estado=?, importe=? WHERE id=?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, reserva.getNumeroPersonas());
            ps.setString(2, reserva.getEstado());
            ps.setDouble(3, reserva.getImporte());
            ps.setInt(4, reserva.getNumeroReserva());
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success;
    }

    /**
     * Elimina una reserva de la base de datos por su ID.
     *
     * @param id El ID de la reserva a eliminar.
     * @param conn La conexión a la base de datos.
     * @return true si la operación fue exitosa, false en caso contrario.
     */
    @Override
    public boolean deleteByID(String id, Connection conn) {
        throw new UnsupportedOperationException("Not supported yet."); // Implementación pendiente
    }

    /**
     * Busca una reserva en la base de datos por su ID.
     *
     * @param termino El ID de la reserva a buscar.
     * @param conn La conexión a la base de datos.
     * @return La reserva encontrada, o null si no se encuentra.
     */
    @Override
    public Reserva findById(String termino, Connection conn) {
        throw new UnsupportedOperationException("Not supported yet."); // Implementación pendiente
    }

}
