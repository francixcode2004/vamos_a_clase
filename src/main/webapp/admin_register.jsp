<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="models.InstructorDao" %>
<%
    InstructorDao instructor = new InstructorDao();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administrador vamos a clase</title>
<link rel="stylesheet" href="admin_register.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axe-core/4.0.2/axe.min.js"></script>
    <script>
        window.onload = function() {
            axe.run(function (err, results) {
                if (err) throw err;
                console.log(results);
            });
        }
    </script>
</head>
<body>
<%
HttpSession sesion = request.getSession();
String usuario = (String) sesion.getAttribute("usuario");
Integer perfil = (Integer) sesion.getAttribute("perfil");

if (usuario == null || perfil == null || perfil != 1) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=Debe iniciar sesi�n para acceder a esta p�gina.");
} else {
%>
    <div class="flex flex-col min-h-screen">
        <header class="header">
            <a class="logo" href="admin.jsp">
                <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H20v20H6.5a2.5 2.5 0 0 1 0-5H20" />
                </svg>
                <span>�Vamos a clase!</span>
            </a>
            <nav class="nav">
                <a href="admin.jsp">Inicio</a>
			    <a href="${pageContext.request.contextPath}/UserServlet?action=cerrar">Cerrar Sesi�n</a>
            </nav>
        </header>
        <main class="main">
          <section class="container">
        <h1 class="form-title">Agregar usuario privilegiado</h1>
        <p class="form-subtitle">Crea nuevos usuarios con acceso privilegiado a tu plataforma.</p>
       <form action="${pageContext.request.contextPath}/InstructorServlet" method="post" enctype="multipart/form-data">
	    <label for="name">Nombre</label>
	    <input id="name" name="name" type="text" placeholder="Ingresa el nombre">
	    <label for="email">Correo electr�nico</label>
	    <input id="email" name="email" type="email" placeholder="Ingresa el correo electr�nico">
	    <label for="university">Universidad</label>
	    <input id="university" name="university" type="text" placeholder="Nombre de la universidad">
	    <label for="phone">N�mero de tel�fono</label>
	    <input id="phone" name="phone" type="tel" placeholder="Ingresa el n�mero de tel�fono">
	    <label for="university-level">Nivel de la universidad</label>
	    <input id="university-level" name="university-level" type="text" placeholder="Ingresa el nivel de la universidad">
		<label for="password">Contrase�a</label>
	    <input id="password" name="password" type="password" placeholder="Ingresa una contrase�a segura">
			<label for="teaching-subject">Tema que ense�a</label>
		   <%
		   		
		   		String combo_temas=instructor.mostrarTemas();
		   		out.print(combo_temas);
		   %>
	    <button class="submit-button" name="action" value="registerInstructor" type="submit">Agregar usuario</button>
	</form>


    </section>
    
        </main>
    </div>
    <footer class="footer">
        <div class="footer-content">
            <p class="footer-text">� 2024 �Vamos a clase!</p>
            <div class="social-icons">
                <a class="icon-link" href="#">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z" />
                    </svg>
                </a>
                <a class="icon-link" href="#">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z" />
                    </svg>
                </a>
                <a class="icon-link" href="#">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <rect width="20" height="20" x="2" y="2" rx="5" ry="5" />
                        <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z" />
                        <line x1="17.5" x2="17.51" y1="6.5" y2="6.5" />
                    </svg>
                </a>
                <a class="icon-link" href="#">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z" />
                        <rect width="4" height="12" x="2" y="9" />
                        <circle cx="4" cy="4" r="2" />
                    </svg>
                </a>
            </div>
        </div>
        <nav class="footer-nav">
            <a class="footer-link" href="#">T�rminos de servicio</a>
            <a class="footer-link" href="#">Pol�tica de privacidad</a>
        </nav>
    </footer>
 <%} %>
</body>
</html>