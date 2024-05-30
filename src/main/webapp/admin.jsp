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
<link rel="stylesheet" href="admin.css">
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
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=Debe iniciar sesión para acceder a esta página.");
} else {
%>
    <div class="flex flex-col min-h-screen">
        <header class="header">
            <a class="logo" href="admin.jsp">
                <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H20v20H6.5a2.5 2.5 0 0 1 0-5H20" />
                </svg>
                <span>¡Vamos a clase!</span>
            </a>
            <nav class="nav">
                <a href="admin_register.jsp">Ingresar Instructor</a>
			    <a href="${pageContext.request.contextPath}/UserServlet?action=cerrar">Cerrar Sesión</a>
            </nav>
        </header>
        <main class="main">
        <section class="hero">
                <div class="container">
                    <div class="hero-content">
                        <div>
                            <h1>Bienvenido administrador  <%= usuario %> ¡Vamos a clase!</h1>
                        </div>
                        <div class="search">
                            <input class="search-input" placeholder="Buscar por usuarios..." type="search">
                            <button class="search-button">Buscar</button>
                        </div>
                    </div>
                </div>
            </section>
           <div class="container">
				<section class="container">
                    <h2 class="form-title">Instructores existentes</h2>
                    <p class="form-subtitle">Lista de usuarios registrados en la plataforma.</p>
                    <%
                   		String contextPath = request.getContextPath();
                    	String card_ins= instructor.listarInstructores(contextPath);
                    	out.print(card_ins);
                    %>
                </section>
  </div>
            

    <footer class="footer">
        <div class="footer-content">
            <p class="footer-text">© 2024 ¡Vamos a clase!</p>
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
            <a class="footer-link" href="#">Términos de servicio</a>
            <a class="footer-link" href="#">Política de privacidad</a>
        </nav>
    </footer>
        </main>
    </div>
<%
}
%>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const searchButton = document.querySelector('.search-button');
        const searchInput = document.querySelector('.search-input');
        const mainContent = document.querySelector('.main');
        searchButton.addEventListener('click', function() {
            const searchText = searchInput.value.trim().toLowerCase();
            const allTextElements = mainContent.querySelectorAll('h1, h2, h3, p, a');
            allTextElements.forEach(element => {
                const elementText = element.textContent.trim().toLowerCase();
                if (elementText.includes(searchText)) {
                    element.scrollIntoView({ behavior: 'smooth', block: 'center' });
                    console.log('Found:', element.textContent); 
                    return;
                }
            });
        }); 
        searchInput.addEventListener('keypress', function(event) {
            if (event.key === 'Enter') {
                searchButton.click();
            }
        });
    });
</script>
</body>
</html>