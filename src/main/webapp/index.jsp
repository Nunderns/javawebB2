<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Livro" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Simulação de livros (em produção, vem do banco de dados via Servlet)
    List<Livro> livros = (List<Livro>) request.getAttribute("livros");
    if (livros == null) {
        livros = new java.util.ArrayList<>();
        livros.add(new Livro("Dom Casmurro", "Machado de Assis", "Romance", 1899));
        livros.add(new Livro("A Hora da Estrela", "Clarice Lispector", "Ficção", 1977));
        livros.add(new Livro("Capitães da Areia", "Jorge Amado", "Ficção", 1937));
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Biblioteca - Catálogo</title>
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

        * { margin: 0; padding: 0; box-sizing: border-box; }

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
            display: block;
        }

        main { padding: 2rem; }

        .catalogo {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 1.5rem;
        }

        .livro {
            background-color: var(--card-bg);
            border-radius: var(--radius);
            padding: 1rem;
            box-shadow: var(--shadow);
        }

        .livro h3 { font-size: 1.1rem; }
        .livro p { font-size: 0.9rem; color: var(--gray); }

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
    <h1>Biblioteca Digital</h1>
    <div class="user-menu">
        <span class="user-name">Olá, <%= usuario.getNome() %> 📚</span>
        <div class="dropdown">
            <a href="logout.jsp">Sair</a>
        </div>
    </div>
</header>

<main>
    <h2 style="margin-bottom: 1rem;">📚 Catálogo de Livros</h2>
    <section class="catalogo">
        <% for (Livro livro : livros) { %>
            <div class="livro">
                <h3><%= livro.getTitulo() %></h3>
                <p><strong>Autor:</strong> <%= livro.getAutor() %></p>
                <p><strong>Categoria:</strong> <%= livro.getCategoria() %></p>
                <p><strong>Ano:</strong> <%= livro.getAno() %></p>
            </div>
        <% } %>
    </section>
</main>

<footer>
    © 2025 Biblioteca Digital - Todos os direitos reservados.
</footer>

</body>
</html>
