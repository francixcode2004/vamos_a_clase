package servlets;

import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import models.InstructorDao;
import models.User;
import models.UserDao;

/**
 * Servlet implementation class UserServlet
 */
@MultipartConfig
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userdao= new UserDao();
	private InstructorDao instructordao= new InstructorDao();
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null) {
			switch (action) {
			case "register":
				RegistrarUsuario(request, response);
				break;
			case "iniciarsesion":
				iniciarSesion(request, response);
				break;
			case "cerrar":
				cerrarSesion(request,response);
				break;
			case "add_tutoria":
				Registrar_tutoria(request,response);
				break;
				// añadir más casos según sea necesario
			default:
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no reconocida");
				break;
			}
		} else {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no especificada");
		}
	}

	private void iniciarSesion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String correo = request.getParameter("email");
			String password = request.getParameter("password");
			String page = userdao.InicarSesion(correo, password);
			HttpSession sesion = request.getSession();
			if ("administrador".equals(page)) {
				sesion.setAttribute("usuario", correo);
				sesion.setAttribute("perfil", 1);
				response.sendRedirect(request.getContextPath() + "/admin.jsp");
			} else if ("usuario".equals(page)) {
				sesion.setAttribute("usuario", correo);
				sesion.setAttribute("perfil", 2);
				response.sendRedirect(request.getContextPath() + "/user_index.jsp");
			} else if ("instructor".equals(page)) {
				sesion.setAttribute("usuario", correo);
				sesion.setAttribute("perfil", 3);
				response.sendRedirect(request.getContextPath() + "/instructor.jsp");
			} else {
				response.sendRedirect(request.getContextPath() + "/login.jsp?error=Datos incorrectos. Vuelva a intentarlo.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/login.jsp?error=Error en el servidor. Intente nuevamente.");
		}
	}
	private void RegistrarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		String nombre = request.getParameter("name");
		String correo = request.getParameter("email");
		String clave = request.getParameter("password");
		Part filePart = request.getPart("profile-picture");
		if (filePart == null) {
		    response.sendRedirect(request.getContextPath() + "/register.jsp?error=Por favor, seleccione un archivo para subir.");
		    return; // Salir del método si no hay archivo
		}
		if (nombre == null || correo == null || clave == null) {
		    // Redirige de nuevo al formulario de registro con un mensaje de error o maneja el error adecuadamente
		    response.sendRedirect(request.getContextPath() + "/register.jsp?error=Todos los campos son obligatorios.");
		    return;
		}

		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

		// Verificar si el archivo subido es una imagen con una extensión válida
		if (fileName != null && (fileName.endsWith(".jpg") || fileName.endsWith(".jpeg") || fileName.endsWith(".png"))) {
			// Ruta donde se guardarán las imágenes
			String uploadPath = "C:/eclipse/eclipse/francisco_workspace/Vamos_ah_clase/src/main/webapp/img_perfil/";

			try {
				// Guardar el archivo en el directorio especificado
				filePart.write(uploadPath + fileName);
			} catch (IOException e) {
				e.printStackTrace();
			}

			User nuevoUsuario = new User();
			nuevoUsuario.setNombre(nombre);
			nuevoUsuario.setCorreo(correo);
			nuevoUsuario.setContra(clave);
			nuevoUsuario.setFoto(fileName);

			boolean registrado = userdao.RegistrarUsuario(nuevoUsuario);
			if (registrado) {
				response.sendRedirect(request.getContextPath() + "/login.jsp?mensaje=Registro exitoso. Por favor, inicie sesión.");
			} else {
				response.sendRedirect(request.getContextPath() + "/register.jsp?error=Error al registrar el usuario. Intente nuevamente.");
			}
		} else {
			// El archivo subido no es una imagen válida
			response.sendRedirect(request.getContextPath() + "/register.jsp?error=Por favor, seleccione un archivo de imagen válido (jpg, jpeg o png).");
		}
	} 

	private void cerrarSesion(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false); // Obtener la sesión si existe, sin crear una nueva
		if (session != null) {
			session.invalidate(); // Invalidar la sesión
		}
		response.sendRedirect(request.getContextPath() + "/index.jsp"); // Redirigir a la página de index
	}
	private void Registrar_tutoria(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    // Obtener los parámetros del formulario
	    String nombreEstudiante = request.getParameter("name");  // Suponiendo que el campo en el formulario se llama "name"
	    String nombreInstructor = request.getParameter("instructor");  // Suponiendo que el campo en el formulario se llama "tutor"
	    String tema = request.getParameter("teaching-subject");  // Suponiendo que el campo en el formulario se llama "teaching-subject"
	    String fecha = request.getParameter("date");
	    String hora = request.getParameter("time");
	    boolean success = instructordao.ingresarTutoria(nombreEstudiante, nombreInstructor, tema, fecha, hora);

	    if (success) {
	        response.sendRedirect(request.getContextPath() + "/user_index.jsp?mensaje=Tutoría registrada con éxito.");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/error.jsp?mensaje=Error al registrar la tutoría");  // Página de error
	    }
	}


}
