<%@ page import="java.util.List" %>
<%@ page import="model.Livro" %>
<%@ page import="model.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.SuppressWarnings" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    @SuppressWarnings("unchecked")
    List<Livro> livros = (List<Livro>) request.getAttribute("livros");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Livros</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f9fafb;
            color: #1f2937;
            padding: 2rem;
        }

        h1 {
            color: #4f46e5;
            text-align: center;
            margin-bottom: 2rem;
        }

        .livro-lista {
            max-width: 800px;
            margin: auto;
            background: #fff;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
        }

        .livro-item {
            padding: 1rem;
            border-bottom: 1px solid #e5e7eb;
        }

        .livro-item:last-child {
            border-bottom: none;
        }

        .livro-titulo {
            font-weight: 600;
            font-size: 1.1rem;
        }

        .livro-autor {
            font-size: 0.95rem;
            color: #6b7280;
        }

        .voltar {
            text-align: center;
            margin-top: 2rem;
        }

        .voltar a {
            text-decoration: none;
            color: #4f46e5;
            font-weight: 500;
        }

        .voltar a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h1>Lista de Livros</h1>

    <div class="livro-lista">
        <%
            if (livros == null || livros.isEmpty()) {
        %>
            <p style="text-align: center; font-style: italic;">Nenhum livro cadastrado.</p>
        <%
            } else {
                for (Livro livro : livros) {
        %>
            <div class="livro-item">
                <div class="livro-titulo"><%= livro.getTitulo() %></div>
                <div class="livro-autor">Autor: <%= livro.getAutor() %></div>
            </div>
        <%
                }
            }
        %>
    </div>

    <div class="voltar">
        <a href="index.jsp">Voltar para a página inicial</a>
    </div>

</body>
</html>
