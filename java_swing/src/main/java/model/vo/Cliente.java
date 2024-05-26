package model.vo;

/**
 * Clase que representa un Cliente de Galicia Secreta.
 * Esta clase se utiliza para almacenar y gestionar la información de los clientes
 * que participan en las rutas enoturísticas de la empresa.
 * Proporciona constructores para inicializar objetos Cliente 
 * y métodos getter y setter para acceder y modificar sus atributos.
 * 
 * @autor Lucia
 */
public class Cliente {

    // Atributos que almacenan la información del cliente
    private String id;
    private String nombre;
    private String apellidos;
    private String telefono;
    private String email;
    private String direccion;

    /**
     * Constructor sin parámetros que inicializa todos los atributos con 
     * cadenas vacías
     */
    public Cliente() {
        this.id = new String();
        this.nombre = new String();
        this.apellidos = new String();
        this.telefono = new String();
        this.email = new String();
        this.direccion = new String();
    }

    /**
     * Constructor con parámetros que inicializa los atributos con los 
     * valores proporcionados.
     * 
     * @param id El identificador del cliente.
     * @param nombre El nombre del cliente.
     * @param apellidos Los apellidos del cliente.
     * @param telefono El teléfono del cliente.
     * @param email El correo electrónico del cliente.
     * @param direccion La dirección del cliente.
     */
    public Cliente(String id, String nombre, String apellidos, String telefono,
            String email, String direccion) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.email = email;
        this.direccion = direccion;
    }

    // Métodos getter y setter para acceder y modificar los atributos del cliente

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    
}
