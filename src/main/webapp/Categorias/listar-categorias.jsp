<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Categoria" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Categorias</title>
    <style>
        body { font-family: sans-serif; background: #f5f5f5; padding: 20px; }
        table { width: 100%; border-collapse: collapse; background: white; margin-bottom: 20px; }
        th, td { padding: 12px; border: 1px solid #ccc; text-align: left; }
        th { background: #eee; }
        a.button { background: #27ae60; color: white; padding: 8px 12px; text-decoration: none; border-radius: 4px; }
        a.button:hover { background: #1e874b; }
        .actions a { margin-right: 8px; }
    </style>
</head>
<body>
    <h1>Categorias</h1>
    <a href="cadastrar-categoria.jsp" class="button">+ Nova Categoria</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Ações</th>
        </tr>
        <%
            Object catObj = request.getAttribute("categorias");
            List<Categoria> categorias = new java.util.ArrayList<>();

            if (catObj instanceof List<?>) {
                for (Object obj : (List<?>) catObj) {
                    if (obj instanceof Categoria) {
                        categorias.add((Categoria) obj);
                    }
                }
            }

            if (!categorias.isEmpty()) {
                for (Categoria c : categorias) {
        %>
        <tr>
            <td><%= c.getId() %></td>
            <td><%= c.getNome() %></td>
            <td class="actions">
                <a href="categoria?acao=editar&id=<%= c.getId() %>">Editar</a>
                <a href="categoria?acao=excluir&id=<%= c.getId() %>" onclick="return confirm('Deseja excluir?')">Excluir</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">Nenhuma categoria encontrada.</td>
        </tr>
        <%
            }
        %>
    </table>
    <a href="index.jsp">← Voltar</a>
</body>
</html>
