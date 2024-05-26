package model.vo;

import java.time.LocalDateTime;

/**
 * Esta clase representa una reserva en el sistema.
 * Contiene información sobre el número de reserva, el cliente, la ruta, la fecha y hora de la ruta, 
 * el número de personas, el estado de la reserva y el importe.
 * 
 * @author Lucía Méndez Rodríguez
 */
public class Reserva {
   private int numeroReserva; // Número de la reserva
   private String clienteRuta; // Cliente asociado a la reserva
   private String nombreRuta; // Nombre de la ruta reservada
   private LocalDateTime fechaHoraRuta; // Fecha y hora de la ruta
   private int numeroPersonas; // Número de personas en la reserva
   private String estado; // Estado de la reserva (pendiente, confirmada, cancelada, etc.)
   private double importe; // Importe total de la reserva

    /**
     * Constructor por defecto de la clase Reserva.
     * Inicializa los atributos con valores predeterminados.
     */
    public Reserva() {
        this.numeroReserva = -1;
        this.clienteRuta = new String();
        this.nombreRuta = new String();
        this.fechaHoraRuta = null;
        this.numeroPersonas = -1;
        this.estado = new String();
        this.importe = -1;
    }

    /**
     * Constructor con parámetros de la clase Reserva.
     * Permite inicializar todos los atributos con valores proporcionados.
     * 
     * @param numeroReserva Número de la reserva
     * @param clienteRuta Cliente asociado a la reserva
     * @param nombreRuta Nombre de la ruta reservada
     * @param fechaHoraRuta Fecha y hora de la ruta
     * @param numeroPersonas Número de personas en la reserva
     * @param estado Estado de la reserva
     * @param importe Importe total de la reserva
     */
    public Reserva(int numeroReserva, String clienteRuta, String nombreRuta,
            LocalDateTime fechaHoraRuta, int numeroPersonas, String estado,
            double importe) {
        this.numeroReserva = numeroReserva;
        this.clienteRuta = clienteRuta;
        this.nombreRuta = nombreRuta;
        this.fechaHoraRuta = fechaHoraRuta;
        this.numeroPersonas = numeroPersonas;
        this.estado = estado;
        this.importe = importe;
    }
    
    // Métodos getter y setter para cada atributo de la clase

    public int getNumeroReserva() {
        return numeroReserva;
    }

    public void setNumeroReserva(int numeroReserva) {
        this.numeroReserva = numeroReserva;
    }    
    
    public String getClienteRuta() {
        return clienteRuta;
    }

    public void setClienteRuta(String clienteRuta) {
        this.clienteRuta = clienteRuta;
    }

    public String getNombreRuta() {
        return nombreRuta;
    }

    public void setNombreRuta(String nombreRuta) {
        this.nombreRuta = nombreRuta;
    }

    public LocalDateTime getFechaHoraRuta() {
        return fechaHoraRuta;
    }

    public void setFechaHoraRuta(LocalDateTime fechaHoraRuta) {
        this.fechaHoraRuta = fechaHoraRuta;
    }

    public int getNumeroPersonas() {
        return numeroPersonas;
    }

    public void setNumeroPersonas(int numeroPersonas) {
        this.numeroPersonas = numeroPersonas;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public double getImporte() {
        return importe;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    } 
}
