<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>¡Vamos a clase!</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <div class="flex flex-col min-h-screen">
        <header class="header">
            <a class="logo" href="index.jsp">
                <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H20v20H6.5a2.5 2.5 0 0 1 0-5H20" />
                </svg>
                <span>¡Vamos a clase!</span>
            </a>
            <nav class="nav">
                <a href="index.jsp">Inicio</a>
                <a href="about.jsp">Sobre Nosotros</a>
                <a href="blog.jsp">Blog</a>
                <a href="contactanos.jsp">Contactanos</a>
                <a href="login.jsp">Login</a>
            </nav>
        </header>
	<main class="main">
        <section class="hero">
            <div class="container hero-content">
                <h1>Sobre Nosotros</h1>
                  <p>Soy Francisco Lopez, un entusiasta de la programación. Mi intención con este proyecto es poder ayudar a 
                  personas con bajos recursos. Estudio en la Universidad Politécnica Salesiana de Ecuador y me encuentro en el
                   quinto semestre. Desde que comencé mis estudios, me he apasionado por la tecnología y el desarrollo de software,
                    y he participado en varios proyectos comunitarios y hackathons. Creo firmemente que la educación y la tecnología 
                    pueden ser herramientas poderosas para cambiar el mundo, y mi objetivo es hacer que el aprendizaje de la programación 
                    sea accesible para todos, independientemente de sus circunstancias económicas. Además, disfruto colaborando con otros y
                     siempre estoy buscando oportunidades para aprender y crecer profesionalmente.</p>

            </div>
        </section>
    </main>
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
</body>
</html>