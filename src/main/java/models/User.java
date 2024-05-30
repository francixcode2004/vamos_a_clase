package models;

public class User {
	private Integer id_usuario;
	private Integer id_perfil;
	private String nombre;
	private String correo;
	private String contra;
	private String foto;
	public User(Integer id_usuario, Integer id_perfil, String nombre, String correo, String contra, String foto) {
		super();
		this.id_usuario = id_usuario;
		this.id_perfil = id_perfil;
		this.nombre = nombre;
		this.correo = correo;
		this.contra = contra;
		this.foto = foto;
	}
	public User() {
		// TODO Auto-generated constructor stub
	}
	public Integer getId_usuario() {
		return id_usuario;
	}
	public void setId_usuario(Integer id_usuario) {
		this.id_usuario = id_usuario;
	}
	public Integer getId_perfil() {
		return id_perfil;
	}
	public void setId_perfil(Integer id_perfil) {
		this.id_perfil = id_perfil;
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
	public String getContra() {
		return contra;
	}
	public void setContra(String contra) {
		this.contra = contra;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	
}
