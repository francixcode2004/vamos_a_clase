package models;

public class Instructor {
	private int idUsuario; 
    private int idPerfil;
    private String nombre;
    private String correo;
    private String contraseña;
    private String foto;
    private String universidad;
    private String telefono;
    private String nivelUniversidad;
    private int idTema;
	public Instructor(int idUsuario, int idPerfil, String nombre, String correo, String contraseña, String foto,
			String universidad, String telefono, String nivelUniversidad, int idTema) {
		super();
		this.idUsuario = idUsuario;
		this.idPerfil = idPerfil;
		this.nombre = nombre;
		this.correo = correo;
		this.contraseña = contraseña;
		this.foto = foto;
		this.universidad = universidad;
		this.telefono = telefono;
		this.nivelUniversidad = nivelUniversidad;
		this.idTema = idTema;
	}
	public Instructor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public int getIdPerfil() {
		return idPerfil;
	}
	public void setIdPerfil(int idPerfil) {
		this.idPerfil = idPerfil;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCorreo() {
		return correo;
	}
	public void setCorreo(String correo) {
		this.correo = correo;
	}
	public String getContraseña() {
		return contraseña;
	}
	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public String getUniversidad() {
		return universidad;
	}
	public void setUniversidad(String universidad) {
		this.universidad = universidad;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getNivelUniversidad() {
		return nivelUniversidad;
	}
	public void setNivelUniversidad(String nivelUniversidad) {
		this.nivelUniversidad = nivelUniversidad;
	}
	public int getIdTema() {
		return idTema;
	}
	public void setIdTema(int idTema) {
		this.idTema = idTema;
	}
    
	
}
