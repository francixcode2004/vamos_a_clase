package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Instructor;
import models.InstructorDao;
import models.Recurso;


/**
 * Servlet implementation class InstructorServlet
 */
@MultipartConfig
@WebServlet("/InstructorServlet")
public class InstructorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private InstructorDao instructordao=new InstructorDao();

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action != null) {
			switch (action) {
			case "registerInstructor":
				RegistrarInstructor(request, response);
				break;
			case "borrarInstructor":
				EliminarInstructor(request, response);
				break;
			case "subirRecurso":
				subir_recurso(request, response);
				break;
			default:
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no reconocida");
				break;
			}
		} else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no especificada");
		}
	}

	private void RegistrarInstructor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	    String nombre = request.getParameter("name");
	    String correo = request.getParameter("email");
	    String clave = request.getParameter("password");
	    String telefono = request.getParameter("phone");
	    String universidad = request.getParameter("university");
	    String nivelUniversidad = request.getParameter("university-level");
	    int idTema = Integer.parseInt(request.getParameter("teaching-subject"));

	    // Validación de los campos requeridos
	    if (nombre == null || correo == null || clave == null || telefono == null || universidad == null || nivelUniversidad == null) {
	        response.sendRedirect(request.getContextPath() + "/register.jsp?error=Todos los campos son obligatorios.");
	        return;
	    }

	    
	    Instructor nuevoInstructor = new Instructor();
	    nuevoInstructor.setNombre(nombre);
	    nuevoInstructor.setCorreo(correo);
	    nuevoInstructor.setContraseña(clave);
	    nuevoInstructor.setTelefono(telefono);
	    nuevoInstructor.setUniversidad(universidad);
	    nuevoInstructor.setNivelUniversidad(nivelUniversidad);
	    nuevoInstructor.setIdTema(idTema); 


	    boolean registrado = instructordao.RegistrarInstructor(nuevoInstructor);

	    // Manejar la respuesta al usuario
	    if (registrado) {
	        response.sendRedirect(request.getContextPath() + "/admin.jsp?mensaje=Registro exitoso. Por favor, inicie sesión.");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/register.jsp?error=Error al registrar el usuario. Intente nuevamente.");
	    }
	}
	private void EliminarInstructor(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	    String idUsuario = request.getParameter("idUsuario");

	    // Validación del ID de usuario
	    if (idUsuario == null || idUsuario.isEmpty()) {
	        response.sendRedirect(request.getContextPath() + "/admin.jsp?error=ID de usuario no proporcionado.");
	        return;
	    }

	    // Convertir el ID de usuario a entero
	    int id = Integer.parseInt(idUsuario);

	    // Lógica para eliminar el usuario con el ID proporcionado
	    boolean eliminado = instructordao.eliminarInstructor(id);

	    // Manejar la respuesta al usuario
	    if (eliminado) {
	        response.sendRedirect(request.getContextPath() + "/admin.jsp?mensaje=Instructor eliminado exitosamente.");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/admin.jsp?error=Error al eliminar el instructor. Intente nuevamente.");
	    }
	}

	private void  subir_recurso(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String videoTitle = request.getParameter("videoTitle");
	    String videoDescription = request.getParameter("videoDescription");
	    String youtubeUrl = request.getParameter("youtubeUrl");
	    String relatedLink = request.getParameter("relatedLink");
	    Recurso recurso= new Recurso(videoTitle,videoDescription,youtubeUrl,relatedLink);
	    
	    if (videoTitle == null || videoTitle.isEmpty() ||
	            videoDescription == null || videoDescription.isEmpty() ||
	            youtubeUrl == null || youtubeUrl.isEmpty() ||
	            relatedLink == null || relatedLink.isEmpty()) {
	            response.sendRedirect(request.getContextPath() + "/instructor_tema.jsp?error=Todos los campos son obligatorios.");
	            return;
	        }
	    boolean guardado = instructordao.SubirRecurso(recurso);

	    // Manejar la respuesta al usuario
	    if (guardado) {
	        response.sendRedirect(request.getContextPath() + "/instructor_tema.jsp?mensaje=Video subido exitosamente.");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/instructor_tema.jsp?error=Error al subir el video. Intente nuevamente.");
	    }
	}
	
	
	

} 
