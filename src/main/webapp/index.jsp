<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>¡Vamos a clase! subir</title>
    <link rel="stylesheet" href="styles.css">
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
    <div class="flex flex-col min-h-screen">
        <header class="header">
            <a class="logo" href="index.jsp">
                <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M4 19.5v-15A2.5 2.5 0 0 1 6.5 2H20v20H6.5a2.5 2.5 0 0 1 0-5H20" />
                </svg>
                <span>¡Vamos a clase!</span>
            </a>
            <p>
			    <a href="http://jigsaw.w3.org/css-validator/check/referer">
			        <img style="border:0;width:88px;height:31px"
			            src="http://jigsaw.w3.org/css-validator/images/vcss"
			            alt="¡CSS Válido!" />
			    </a>
			</p>
			<p>
			<a href="http://jigsaw.w3.org/css-validator/check/referer">
			    <img style="border:0;width:88px;height:31px"
			        src="http://jigsaw.w3.org/css-validator/images/vcss-blue"
			        alt="¡CSS Válido!" />
			    </a>
			</p>
            <nav class="nav">
                <a href="#noticias">Noticias</a>
                <a href="#fotos">Fotos</a>
			    <a href="#audio">Audio</a>
			    <a href="#video">Video</a>
                <a href="login.jsp">Login</a>
            </nav>
        </header>
        <main class="main">
            <section class="hero">
                <div class="container">
                    <div class="hero-content">
                        <div>
                            <h1>Bienvenido a ¡Vamos a clase!</h1>
                            <p>Aquí encontrarás todo lo que necesitas para tus estudios: noticias, fotos, audio y video.</p>
                        </div>
                        <div class="search">
                            <input class="search-input" placeholder="Buscar..." type="search">
                            <button class="search-button">Buscar</button>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section" ">
                <div class="container">
                    <div class="section-header">
                        <h2 id="noticias">Noticias</h2>
                        <p>Mantente al día con las últimas noticias de la escuela.</p>
                    </div>
                    <div class="card-grid">
                        <div class="card">
                            <img src="./public/news_Angular_18.png" alt="Noticia 1 Angular 18">
                            <div class="card-content">
                                <h3>Angular 18</h3>
                                <p>Descubre las ultimas novedades de Angular 18.</p>
                                <a href="https://dev.to/this-is-angular/whatnew-in-angular-18-60j">Leer más</a>
                            </div>
                        </div>
                        <div class="card">
                            <img src="./public/news_kotlin.png" alt="Noticia 2 Google apuesta todo su nivel por kotlin multiplatform">
                            <div class="card-content">
                                <h3>¿Google apuesta todo su nivel por kotlin multiplatform?</h3>
                                <p>Google dice que el futuro va hacer kotlin.</p>
                                <a href="https://www.youtube.com/watch?v=MJYFp11bBdc">Ver más</a>
                            </div>
                        </div>
                        <div class="card">
                            <img src="./public/news_linux.jpeg" alt="Noticia 3 Virus en linux">
                            <div class="card-content">
                                <h3>El mundo en jaque por un virus informatico</h3>
                                <p>!Atención mundial¡ descubren un virus en el ecosistema de linux.</p>
                                <a href="https://bitlifemedia.com/2024/04/seguridad-usuarios-linux-desarrollador-codigo-malicioso/">Leer más</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section section-alt">
                <div class="container">
                    <div class="section-header">
                        <h2>Fotos, Audio y Video</h2>
                        <p>Explora nuestras galerías de fotos, audios y videos.</p>
                    </div>
                    <div class="card-grid">
                        <div class="card">
                            <img src="./public/foto_tic_tac_toe.jpg" alt="Foto Juego tic tac toe">
                            <div class="card-content" id="fotos">
                                <h3>TIC TAC Toe</h3>
                                <p>Un juego desarrollado en javascript.</p>
                                <a href="https://github.com/francixcode2004/tic-tac-toe">Conoce más</a>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-content" id="audio">
                                <audio controls>
                                    <source src="./public/audio_server.mp3" type="audio/mpeg">
                                    	
                                </audio>
                                <h3>Crea tu propio server SMTP</h3>
                                <p>Conoce como crear un servidor smtp en red hat.</p>
                                <a href="https://www.youtube.com/watch?v=NHJyYzvwlzA">Escuchar más</a>
                            </div>
                        </div>
                        <div class="card">
                            <iframe width="100%" src="https://www.youtube.com/embed/pXaapefutYc?si=8u-7_x48UvszRjs6" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                            <div class="card-content"id="video">	
                                <h3>Tu primer hola mundo en GO</h3>
                                <p>Inicia en el mundo de go nunca feu tan sencillo.</p>
                                <a href="https://www.youtube.com/watch?v=AGiayASyp2Q&t=1868s">Ver más</a>
                            </div>
                        </div>
                        <div class="card">
                        <iframe width="100%" src="https://www.youtube.com/embed/MEbEGtc4rEM?si=64A4q_S5KFNJxOPj" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                            <div class="card-content">	
                                <h3>Servidor con typescript</h3>
                                <p>Inicia en el mundo del desarrollo web con typescript..</p>
                                <a href="https://www.youtube.com/watch?v=T7uaEZ3ZoZE">Ver más</a>
                            </div>
                        </div>
                    
                    </div>
                </div>
            </section>
            <section class="section">
        <div class="container">
            <div class="header">
                <h2 class="title">Enlaces importantes</h2>
                <p class="description">Accede a páginas clave de nuestro sitio web.</p>
            </div>
            <div class="cards">
                <div class="card">
                    <div class="card-content">
                        <h3 class="card-title">Sobre nosotros</h3>
                        <p class="card-description">Conoce más sobre nuestra escuela y nuestro equipo.</p>
                        <a class="button" href="about.jsp">Ir a Sobre nosotros</a>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <h3 class="card-title">Blog</h3>
                        <p class="card-description">Lee nuestros últimos artículos y noticias.</p>
                        <a class="button" href="blog.jsp">Ir al Blog</a>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <h3 class="card-title">Contáctanos</h3>
                        <p class="card-description">Ponte en contacto con nosotros para cualquier duda o consulta y forma parte de nuestro equipo.</p>
                        <a class="button" href="contactanos.jsp">Contactar</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
