<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>¡Vamos a clase!</title>
    <link rel="stylesheet" href="styles.css">
     <link rel="stylesheet" href="blog.css">
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
            <nav class="nav">
                <a href="index.jsp">Inicio</a>
                <a href="about.jsp">Sobre Nosotros</a>
                <a href="blog.jsp">Blog</a>
                <a href="contactanos.jsp">Contactanos</a>
                <a href="login.jsp">Login</a>
            </nav>
        </header>
        <main class="main">
         <div class="container">
        <article class="article">
            <div class="img-principal">
			  <img src="./public/img_blog1.jpg" alt="Imagen destacada">
			</div>
            <div class="content">
                <p>
                    En un mundo cada vez más digitalizado, la educación en programación se ha convertido en una habilidad
                    fundamental para los jóvenes que buscan abrirse camino en el mercado laboral. Sin embargo, la transición
                    de las aulas tradicionales a las plataformas virtuales ha presentado desafíos únicos que los estudiantes
                    han tenido que enfrentar.
                </p>
                <p>
                    En este artículo, exploraremos la experiencia de los jóvenes que han optado por estudiar programación a
                    través de una plataforma virtual. Descubriremos cómo han adaptado su estilo de aprendizaje, las
                    herramientas que han utilizado para mantenerse motivados y las lecciones valiosas que han aprendido a lo
                    largo del camino.
                </p>
                <p>
                    Uno de los aspectos más destacados de la educación virtual en programación es la flexibilidad que ofrece.
                    Los estudiantes pueden acceder a los materiales de estudio en cualquier momento y desde cualquier lugar,
                    lo que les permite equilibrar sus estudios con otras responsabilidades. Sin embargo, esta libertad también
                    ha requerido que desarrollen habilidades de autogestión y disciplina, lo que ha sido un desafío para
                    algunos.
                </p>
                <p>
                    Además, la interacción con los instructores y compañeros de clase ha sido un elemento clave en la
                    experiencia de los estudiantes. A través de foros de discusión, videoconferencias y proyectos
                    colaborativos, los jóvenes han logrado crear una comunidad de aprendizaje virtual, lo que les ha permitido
                    aprender de los demás y recibir retroalimentación valiosa.
                </p>
                <p>
                    A pesar de los desafíos, los estudiantes han destacado la importancia de mantener una actitud positiva y
                    perseverante. Muchos han compartido cómo han encontrado formas creativas de mantenerse motivados, como
                    establecer metas personales, celebrar pequeños logros y buscar inspiración en la comunidad en línea.
                </p>
                <p>
                    En conclusión, la experiencia de los jóvenes al estudiar programación a través de una plataforma virtual
                    ha sido una mezcla de desafíos y oportunidades. Si bien la transición ha requerido adaptación y desarrollo
                    de nuevas habilidades, los estudiantes han demostrado su capacidad de superar obstáculos y aprovechar al
                    máximo las ventajas de la educación en línea. A medida que la demanda de profesionales en programación
                    sigue creciendo, esta experiencia puede servir de inspiración para aquellos que buscan explorar nuevas
                    formas de aprendizaje.
                </p>
            </div>
        </article>
    </div>
    <div class="comments-section">
        <div class="container">
            <h2>Comentarios</h2>
            <div class="comment">
                <img src="placeholder-user.jpg" alt="Imagen de usuario" class="avatar">
                <div class="comment-content">
                    <div class="comment-author">Juan Díaz</div>
                    <p>¡Excelente artículo! Me identifico mucho con la experiencia de los jóvenes en la educación virtual
                    de programación. Es importante destacar la importancia de la disciplina y la perseverancia en este
                    tipo de aprendizaje.</p>
                </div>
            </div>
            <div class="comment">
                <img src="placeholder-user.jpg" alt="Imagen de usuario" class="avatar">
                <div class="comment-content">
                    <div class="comment-author">María Sánchez</div>
                    <p>Me parece muy interesante cómo los jóvenes han logrado crear una comunidad de aprendizaje virtual.
                    Eso debe ser fundamental para mantener la motivación y el apoyo mutuo durante el proceso.</p>
                </div>
            </div>
            <div class="comment">
                <img src="placeholder-user.jpg" alt="Imagen de usuario" class="avatar">
                <div class="comment-content">
                    <div class="comment-author">Lucas Gómez</div>
                    <p>Como alguien que también ha estudiado programación de manera virtual, puedo decir que este artículo
                    refleja muy bien los desafíos y las oportunidades que ofrece esta modalidad de aprendizaje.
                    ¡Felicitaciones por el excelente trabajo!</p>
                </div>
            </div>
        </div>
    </div>
           
   
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
    </div>
</body>

</html>
