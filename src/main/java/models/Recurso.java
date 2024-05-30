package models;

public class Recurso {
	private String titulo;
	private String descripcion;
	private String url_youtube;
	private String url_relacionado;
	public Recurso() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Recurso(String titulo, String descripcion, String url_youtube, String url_relacionado) {
		super();
		this.titulo = titulo;
		this.descripcion = descripcion;
		this.url_youtube = url_youtube;
		this.url_relacionado = url_relacionado;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getUrl_youtube() {
		return url_youtube;
	}
	public void setUrl_youtube(String url_youtube) {
		this.url_youtube = url_youtube;
	}
	public String getUrl_relacionado() {
		return url_relacionado;
	}
	public void setUrl_relacionado(String url_relacionado) {
		this.url_relacionado = url_relacionado;
	}
	
	
	

}	
