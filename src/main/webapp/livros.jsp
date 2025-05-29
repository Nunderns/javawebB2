<%@ page import="java.util.List" %>
<%@ page import="model.Livro" %>
<%
    @SuppressWarnings("unchecked")
    List<Livro> livros = (List<Livro>) request.getAttribute("livros");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Livros</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        h2 {
            color: #2c3e50;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 10px;
            border: 1px solid #333;
            text-align: left;
        }

        a {
            display: inline-block;
            margin-bottom: 20px;
            text-decoration: none;
            background-color: #3498db;
            color: white;
            padding: 8px 12px;
            border-radius: 4px;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

    <h2>Livros Cadastrados</h2>

    <a href="novo-livro.jsp">Cadastrar Novo Livro</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Título</th>
            <th>Autor</th>
        </tr>
        <%
            if (livros != null) {
                for (Livro livro : livros) {
        %>
        <tr>
            <td><%= livro.getId() %></td>
            <td><%= livro.getTitulo() %></td>
            <td><%= livro.getAutor() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>

</body>
</html>
