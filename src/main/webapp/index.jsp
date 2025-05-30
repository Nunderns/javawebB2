<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Usuario" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblioteca Digital - Página Inicial</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #4f46e5;
            --primary-light: #6366f1;
            --primary-dark: #4338ca;
            --secondary: #10b981;
            --danger: #ef4444;
            --light: #f9fafb;
            --dark: #1f2937;
            --gray: #6b7280;
            --gray-light: #e5e7eb;
            --white: #ffffff;
            --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.12);
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-md: 0 10px 15px rgba(0, 0, 0, 0.1);
            --radius: 8px;
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light);
            color: var(--dark);
            line-height: 1.6;
            padding-top: 80px;
        }

        /* Header Styles */
        header {
            background-color: var(--primary);
            color: var(--white);
            padding: 1rem 2rem;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: var(--shadow-md);
            z-index: 1000;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 600;
        }

        .logo a {
            color: var(--white);
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 1.5rem;
        }

        .nav-links a {
            color: var(--white);
            text-decoration: none;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: var(--transition);
            padding: 0.5rem;
            border-radius: var(--radius);
        }

        .nav-links a:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .user-menu {
            position: relative;
        }

        .user-toggle {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
            color: var(--white);
            font-weight: 500;
        }

        .dropdown {
            position: absolute;
            right: 0;
            top: 120%;
            background-color: var(--white);
            border-radius: var(--radius);
            box-shadow: var(--shadow-md);
            min-width: 200px;
            overflow: hidden;
            display: none;
            z-index: 1001;
        }

        .dropdown.show {
            display: block;
        }

        .dropdown a {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.75rem 1rem;
            color: var(--dark);
            text-decoration: none;
            transition: var(--transition);
        }

        .dropdown a:hover {
            background-color: var(--gray-light);
            color: var(--primary);
        }

        /* Main Content */
        .hero {
            background: linear-gradient(135deg, var(--primary-light), var(--primary-dark));
            color: var(--white);
            padding: 4rem 2rem;
            text-align: center;
            margin-bottom: 3rem;
        }

        .hero h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .hero p {
            font-size: 1.1rem;
            max-width: 700px;
            margin: 0 auto 2rem;
        }

        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            padding: 0 2rem;
            margin-bottom: 4rem;
        }

        .feature-card {
            background-color: var(--white);
            border-radius: var(--radius);
            padding: 2rem;
            box-shadow: var(--shadow-sm);
            transition: var(--transition);
            text-align: center;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow);
        }

        .feature-icon {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .feature-card h3 {
            font-size: 1.25rem;
            margin-bottom: 0.75rem;
        }

        /* Footer */
        footer {
            background-color: var(--dark);
            color: var(--white);
            text-align: center;
            padding: 2rem;
            margin-top: 3rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }

            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
                gap: 0.5rem;
            }

            .hero h1 {
                font-size: 2rem;
            }

            .features {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<header>
    <div class="logo">
        <a href="index.jsp">Biblioteca Digital</a>
    </div>
    
    <nav class="nav-links">
        <a href="livros"><i class="fas fa-book"></i> Catálogo</a>
        <a href="adicionar-livro.jsp"><i class="fas fa-plus-circle"></i> Adicionar Livro</a>
        <a href="emprestimo.jsp"><i class="fas fa-exchange-alt"></i> Empréstimos</a>
        <a href="criar-autor.jsp"><i class="fas fa-user-edit"></i> Autores</a>
    </nav>
    
    <div class="user-menu" id="userMenu">
        <div class="user-toggle" onclick="toggleDropdown()">
            <i class="fas fa-user-circle"></i>
            <span><%= usuario.getNome() %></span>
            <i class="fas fa-chevron-down"></i>
        </div>
        <div class="dropdown" id="dropdownMenu">
            <a href="perfil.jsp"><i class="fas fa-user"></i> Meu Perfil</a>
            <a href="logout"><i class="fas fa-sign-out-alt"></i> Sair</a>
        </div>
    </div>
</header>

<main>
    <section class="hero">
        <h1>Bem-vindo à Biblioteca Digital</h1>
        <p>Explore nosso acervo completo de livros, autores e categorias. Um mundo de conhecimento ao seu alcance.</p>
    </section>
    
    <section class="features">
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-book-open"></i>
            </div>
            <h3>Catálogo Completo</h3>
            <p>Acesse nossa coleção de livros organizados por categorias e autores.</p>
            <a href="livros" class="btn">Explorar</a>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-search"></i>
            </div>
            <h3>Busca Avançada</h3>
            <p>Encontre exatamente o que precisa com nosso sistema de busca inteligente.</p>
            <a href="busca.jsp" class="btn">Buscar</a>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">
                <i class="fas fa-clock"></i>
            </div>
            <h3>Histórico de Empréstimos</h3>
            <p>Acompanhe todos os livros que você já pegou emprestado.</p>
            <a href="meus-emprestimos.jsp" class="btn">Ver Histórico</a>
        </div>
    </section>
</main>

<footer>
    <p>&copy; 2025 Biblioteca Digital. Todos os direitos reservados.</p>
</footer>

<script>
    function toggleDropdown() {
        const dropdown = document.getElementById('dropdownMenu');
        dropdown.classList.toggle('show');
    }

    // Fechar dropdown ao clicar fora
    document.addEventListener('click', function(event) {
        const userMenu = document.getElementById('userMenu');
        const dropdown = document.getElementById('dropdownMenu');
        
        if (!userMenu.contains(event.target) && dropdown.classList.contains('show')) {
            dropdown.classList.remove('show');
        }
    });
</script>

</body>
</html>