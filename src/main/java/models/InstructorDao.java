package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import controller.DatabaseConnection;

public class InstructorDao {
	public String mostrarTemas() {
		String combo = "<select id=\"teaching-subject\" name=\"teaching-subject\">";
		String sql = "select * from temas;";
		DatabaseConnection con = new DatabaseConnection();
		ResultSet rs = null;
		try {
			rs = con.consulta(sql);
			while (rs.next()) {
				combo += "<option value=\"" + rs.getInt(1) + "\">" + rs.getString(2) + "</option>";
			}
			combo += "</select>";
		} catch (SQLException e) {
			System.out.println("Error al ejecutar la consulta SQL: " + e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close(); // Cerrar el ResultSet si no es nulo
				}
				con.cerrar(); // Cerrar la conexión a la base de datos
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}

		return combo;
	}

	public String listarInstructores(String contextPath) {
		StringBuilder cards = new StringBuilder();
		String sql = "SELECT u.id_usuario, u.nombre, u.correo, i.universidad, i.telefono, i.nivel_universidad, t.nombre_tema AS tema_enseñanza " +
				"FROM usuarios AS u " +
				"JOIN instructores AS i ON u.id_usuario = i.id_usuario " +
				"JOIN temas AS t ON i.id_tema = t.id_tema;";

		DatabaseConnection con = new DatabaseConnection();
		try {
			ResultSet rs = con.consulta(sql);

			while (rs.next()) {
				cards.append("<article class='card'>")
				.append("<header>")
				.append("<h3 class='form-title'>").append(rs.getString("id_usuario")).append(" - ").append(rs.getString("nombre")).append("</h3>")
				.append("<p>").append(rs.getString("correo")).append("</p>")
				.append("</header>")
				.append("<footer>")
				.append("<p>Universidad: ").append(rs.getString("universidad")).append("</p>")
				.append("<p>Teléfono: ").append(rs.getString("telefono")).append("</p>")
				.append("<p>Nivel de Universidad: ").append(rs.getString("nivel_universidad")).append("</p>")
				.append("<p>Tema que enseña: ").append(rs.getString("tema_enseñanza")).append("</p>")
				.append("<form method='post' action='").append(contextPath).append("/InstructorServlet'>")
				.append("<input type='hidden' name='idUsuario' value='").append(rs.getString("id_usuario")).append("'>")
				.append("<button type='submit' class='delete' name='action' value='borrarInstructor'>Eliminar</button>")
				.append("</form>")
				.append("</footer>")
				.append("</article>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "Error al recuperar los instructores.";
		} finally {
			con.cerrar(); // Asegúrate de cerrar la conexión a la base de datos
		}

		return cards.toString();
	}







	public boolean RegistrarInstructor(Instructor instructor) {
		boolean resultado;
		Connection con = null;
		PreparedStatement pr = null;
		try {
			DatabaseConnection conexion = new DatabaseConnection();
			con = conexion.getConexion();

			// Primero, insertamos los datos en la tabla de usuarios con id_perfil fijado a 3 para instructores
			String sqlUsuario = "INSERT INTO usuarios (id_perfil, nombre, correo, contra) VALUES (3, ?, ?, ?);";
			pr = con.prepareStatement(sqlUsuario, Statement.RETURN_GENERATED_KEYS);
			pr.setString(1, instructor.getNombre());
			pr.setString(2, instructor.getCorreo());
			pr.setString(3, instructor.getContraseña());

			int filasAfectadas = pr.executeUpdate();

			if (filasAfectadas == 1) {
				// Obtenemos el ID generado para el usuario
				ResultSet generatedKeys = pr.getGeneratedKeys();
				int idUsuario = -1;
				if (generatedKeys.next()) {
					idUsuario = generatedKeys.getInt(1);
				} else {
					throw new SQLException("No se pudo obtener el ID generado para el usuario.");
				}
				generatedKeys.close();

				// Ahora insertamos los datos específicos de instructor en la tabla de instructores
				String sqlInstructor = "INSERT INTO instructores (id_usuario, universidad, telefono, nivel_universidad, id_tema) VALUES (?, ?, ?, ?, ?);";
				pr = con.prepareStatement(sqlInstructor);
				pr.setInt(1, idUsuario); // Usamos el ID de usuario generado anteriormente
				pr.setString(2, instructor.getUniversidad());
				pr.setString(3, instructor.getTelefono());
				pr.setString(4, instructor.getNivelUniversidad());
				pr.setInt(5, instructor.getIdTema()); // Aquí deberías usar el ID del tema correspondiente

				if (pr.executeUpdate() == 1) {
					resultado = true;
				} else {
					resultado = false;
				}
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

	public boolean eliminarInstructor(int idUsuario) {
		Connection con = null;
		PreparedStatement ps = null;
		String sqlInstructor = "DELETE FROM instructores WHERE id_usuario = ?";
		String sqlUsuario = "DELETE FROM usuarios WHERE id_usuario = ?";
		DatabaseConnection databaseConnection = new DatabaseConnection();

		try {
			con = databaseConnection.getConexion();
			// Deshabilitar auto-commit para manejar transacción manualmente
			con.setAutoCommit(false);

			// Eliminar primero de instructores
			ps = con.prepareStatement(sqlInstructor);
			ps.setInt(1, idUsuario);
			int rowsAffectedInstructor = ps.executeUpdate();

			// Ahora eliminar de usuarios
			ps = con.prepareStatement(sqlUsuario);
			ps.setInt(1, idUsuario);
			int rowsAffectedUsuario = ps.executeUpdate();

			// Si ambas eliminaciones fueron exitosas, hacer commit de la transacción
			if (rowsAffectedInstructor > 0 && rowsAffectedUsuario > 0) {
				con.commit();
				return true;
			} else {
				// Si algo falla, hacer rollback de la transacción
				con.rollback();
				return false;
			}
		} catch (SQLException e) {
			try {
				if (con != null) con.rollback();
			} catch (SQLException se2) {
				se2.printStackTrace();
			}
			e.printStackTrace();
			return false;
		} finally {
			// Cerrar PreparedStatement y Connection
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}


	public boolean SubirRecurso(Recurso recurso) {
	    Connection con = null;
	    PreparedStatement pr = null;
	    try {
	        DatabaseConnection conexion = new DatabaseConnection();
	        con = conexion.getConexion();
	        String sqlrecurso = "INSERT INTO subir_recurso (titulo, descripcion, url_youtube, url_relacional) VALUES (?,?,?,?)";
	        pr = con.prepareStatement(sqlrecurso);
	        pr.setString(1, recurso.getTitulo());
	        pr.setString(2, recurso.getDescripcion());
	        pr.setString(3, recurso.getUrl_youtube());
	        pr.setString(4, recurso.getUrl_relacionado());

	        int filasAfectadas = pr.executeUpdate();
	        return filasAfectadas > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        if (pr != null) {
	            try {
	                pr.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (con != null) {
	            try {
	                con.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}
	public String mostrarInstructores() {
	    String combo = "<select id=\"instructor\" name=\"instructor\" onchange=\"mostrarInformacionTutor()\">";
	    String sql = "SELECT id_usuario, nombre FROM usuarios WHERE id_perfil = 3;";
	    DatabaseConnection con = new DatabaseConnection();
	    ResultSet rs = null;
	    try {
	        rs = con.consulta(sql);
	        while (rs.next()) {
	            combo += "<option value=\"" + rs.getInt("id_usuario") + "\">" + rs.getString("nombre") + "</option>";
	        }
	        combo += "</select>";
	    } catch (SQLException e) {
	        System.out.println("Error al ejecutar la consulta SQL: " + e.getMessage());
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close(); // Cerrar el ResultSet si no es nulo
	            }
	            con.cerrar(); // Cerrar la conexión a la base de datos
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	    }

	    return combo;
	}



}
