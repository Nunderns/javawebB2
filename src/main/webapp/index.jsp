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
    <title>Biblioteca - Página Inicial</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4f46e5;
            --background: #f3f4f6;
            --text: #1f2937;
            --card-bg: #fff;
            --gray: #6b7280;
            --shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
            --radius: 10px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background);
            color: var(--text);
        }

        header {
            background-color: var(--primary);
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .user-menu {
            position: relative;
        }

        .user-name {
            cursor: pointer;
            font-weight: 600;
        }

        .dropdown {
            position: absolute;
            top: 2.8rem;
            right: 0;
            background-color: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            display: none;
            z-index: 100;
        }


        .dropdown a {
            display: block;
            padding: 0.75rem 1rem;
            text-decoration: none;
            color: var(--text);
        }

        .dropdown a:hover {
            background-color: #f0f0f0;
        }

        .user-menu:hover .dropdown {
            display: none;
        }

        main {
            padding: 2rem;
            text-align: center;
        }

        h2 {
            margin-bottom: 1rem;
        }

        .info {
            font-size: 1rem;
            color: var(--gray);
        }

        footer {
            text-align: center;
            padding: 1rem;
            background-color: #e5e7eb;
            margin-top: 3rem;
        }
    </style>
</head>
<body>

<header>
    <h1><a href="index.jsp" style="color: white; text-decoration: none;">Biblioteca Digital</a></h1>
    <nav>
        <a href="adicionar-livro.jsp" style="color: white; margin-right: 20px; text-decoration: underline;">➕ Adicionar Livro</a>
    </nav>
    <div class="user-menu" id="userMenu">
        <span class="user-name" onclick="toggleDropdown()">Olá, <%= usuario.getNome() %> 📚</span>
        <div class="dropdown" id="dropdownMenu">
            <a href="perfil.jsp">Perfil</a>
            <a href="logout">Sair</a>

        </div>
    </div>
</header>


<main>
    <h2>Bem-vindo à Biblioteca</h2>
    <p class="info">Explore nosso acervo de livros por categorias, autores e muito mais.</p>
</main>

<footer>
    © 2025 Biblioteca Digital - Todos os direitos reservados.
</footer>

<script>
    function toggleDropdown() {
        const menu = document.getElementById('dropdownMenu');
        menu.style.display = (menu.style.display === 'block') ? 'none' : 'block';
    }

    document.addEventListener('click', function(event) {
        const userMenu = document.getElementById('userMenu');
        const dropdown = document.getElementById('dropdownMenu');
        if (!userMenu.contains(event.target)) {
            dropdown.style.display = 'none';
        }
    });
</script>

</body>
</html>
