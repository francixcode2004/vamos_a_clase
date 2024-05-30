package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import controller.DatabaseConnection;


public class UserDao {
	
	public String InicarSesion(String correo, String Password) {
        String result = "";
        Connection con = null;
        PreparedStatement pr = null;
        ResultSet rs = null;

        try {
            String sql = "select correo, contra, id_perfil from usuarios where correo = ? and contra = ?;";
            DatabaseConnection conexion = new DatabaseConnection();
            con = conexion.getConexion();
            pr = con.prepareStatement(sql);
            pr.setString(1, correo);
            pr.setString(2, Password);
            rs = pr.executeQuery();

            if (rs.next()) {
                int idPer = rs.getInt("id_perfil");
                if (idPer == 1) {
                    result = "administrador";
                } else if (idPer == 2) {
                    result = "usuario";
                } else if (idPer == 3) {
                    result = "instructor";
                }
            }
        } catch (Exception e) {
            System.out.println("Hubo un error al encontrar al usuario " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pr != null) pr.close();
                if (con != null) con.close();
            } catch (Exception e) {
                System.out.println("Error cerrando recursos: " + e.getMessage());
            }
        }
        return result;
    }
	public boolean RegistrarUsuario(User usuario) {
        boolean resultado;
        Connection con = null;
        PreparedStatement pr = null;
        try {
            DatabaseConnection conexion = new DatabaseConnection();
            con = conexion.getConexion();
            String sql = "INSERT INTO USUARIOS (id_perfil, nombre, correo, contra, foto) VALUES(2, ?, ?, ?, ?);";
            pr = con.prepareStatement(sql);
            pr.setString(1, usuario.getNombre());
            pr.setString(2, usuario.getCorreo());
            pr.setString(3, usuario.getContra());
            pr.setString(4, usuario.getFoto());

            if (pr.executeUpdate() == 1) {
                resultado = true;
            } else {
                resultado = false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            resultado = false;
        } finally {
            try {
                if (pr != null) pr.close();
                if (con != null) con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                resultado = false;
            }
        }
        return resultado;
    }
	public String listarRecursos() {
	    StringBuilder cards = new StringBuilder();
	    String sql = "SELECT titulo, descripcion, url_youtube, url_relacional FROM subir_recurso";

	    DatabaseConnection con = new DatabaseConnection();
	    try {
	        ResultSet rs = con.consulta(sql);
	        
	        while (rs.next()) {
	            String titulo = rs.getString("titulo");
	            String descripcion = rs.getString("descripcion");
	            String urlYoutube = rs.getString("url_youtube");
	            String urlRelacional = rs.getString("url_relacional");
	            
	            // Asegúrate de que la URL de YouTube esté en el formato correcto para incrustar
	            String embedUrl = urlYoutube.replace("watch?v=", "embed/");
	            
	            cards.append("<div class='card'>")
	                 .append("<iframe width='100%' src='").append(embedUrl).append("' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>")
	                 .append("<div class='card-content' id='video'>")
	                 .append("<h3>").append(titulo).append("</h3>")
	                 .append("<p>").append(descripcion).append("</p>")
	                 .append("<a href='").append(urlRelacional).append("'>Ver más</a>")
	                 .append("</div>")
	                 .append("</div>");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return "Error al recuperar los recursos.";
	    } finally {
	        con.cerrar(); // Asegúrate de cerrar la conexión a la base de datos
	    }
	    
	    return cards.toString();
	}

}
