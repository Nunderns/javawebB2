<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Livro" %>
<%@ page import="model.Usuario" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Object livrosObj = request.getAttribute("livros");
    List<Livro> livros = new java.util.ArrayList<>();

    if (livrosObj instanceof List<?>) {
        for (Object obj : (List<?>) livrosObj) {
            if (obj instanceof Livro) {
                livros.add((Livro) obj);
            }
        }
    }

    String mensagem = (String) request.getAttribute("mensagem");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Catálogo de Livros</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }

    body {
        background-color: #f5f7fa;
        color: #333;
        line-height: 1.6;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }

    header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
        padding-bottom: 20px;
        border-bottom: 1px solid #e0e0e0;
    }

    h1 {
        font-size: 28px;
        color: #2c3e50;
        font-weight: 600;
    }

    .btn {
        display: inline-flex;
        align-items: center;
        padding: 10px 15px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .btn-primary {
        background-color: #3498db;
        color: white;
    }

    .btn-primary:hover {
        background-color: #2980b9;
        transform: translateY(-2px);
    }

    .btn i {
        margin-right: 8px;
    }

    .alert {
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 5px;
        display: flex;
        align-items: center;
        background-color: #d4edda;
        color: #155724;
    }

    .alert i {
        margin-right: 10px;
        font-size: 18px;
    }

    .livros-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
        gap: 20px;
        margin-bottom: 40px;
    }

    .livro-card {
        background: white;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        display: flex;
        flex-direction: column;
    }

    .livro-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }

    .livro-imagem {
        height: 150px;
        background-color: #f1f5f9;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #7e8a98;
    }

    .livro-imagem i {
        font-size: 60px;
    }

    .livro-info {
        padding: 20px;
        flex-grow: 1;
    }

    .livro-titulo {
        font-size: 18px;
        margin-bottom: 10px;
        color: #2c3e50;
        font-weight: 600;
    }

    .livro-detalhes {
        font-size: 14px;
        color: #555;
        margin-bottom: 8px;
    }

    .livro-acoes {
        margin-top: 15px;
        display: flex;
        gap: 15px;
    }

    .livro-acoes a {
        color: #3498db;
        text-decoration: none;
        font-size: 14px;
        transition: color 0.3s ease;
        display: flex;
        align-items: center;
    }

    .livro-acoes a:hover {
        color: #2980b9;
    }

    .livro-acoes a i {
        margin-right: 5px;
    }

    .empty-state {
        grid-column: 1 / -1;
        text-align: center;
        padding: 50px 20px;
        color: #7e8a98;
    }

    .empty-state i {
        font-size: 50px;
        margin-bottom: 20px;
        color: #b8c2cc;
    }

    .empty-state h3 {
        font-size: 20px;
        margin-bottom: 10px;
        color: #4a5568;
    }

    .empty-state p {
        font-size: 16px;
    }

    footer {
        text-align: center;
        padding: 20px;
        color: #7e8a98;
        font-size: 14px;
        border-top: 1px solid #e0e0e0;
        margin-top: 30px;
    }

    @media (max-width: 768px) {
        header {
            flex-direction: column;
            align-items: flex-start;
            gap: 15px;
        }

        .livros-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Catálogo de Livros</h1>
            <a href="adicionar-livro" class="btn btn-primary">
                <i class="fas fa-plus"></i> Adicionar Livro
            </a>
        </header>

        <% if (mensagem != null) { %>
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> <%= mensagem %>
            </div>
        <% } %>

        <div class="livros-grid">
            <% if (livros.isEmpty()) { %>
                <div class="empty-state">
                    <i class="fas fa-book-open"></i>
                    <h3>Nenhum livro encontrado</h3>
                    <p>Adicione seu primeiro livro para começar</p>
                </div>
            <% } else { %>
                <% for (Livro livro : livros) { %>
                    <div class="livro-card">
                        <div class="livro-imagem">
                            <i class="fas fa-book"></i>
                        </div>
                        <div class="livro-info">
                            <h3 class="livro-titulo"><%= livro.getTitulo() %></h3>
                            <p class="livro-detalhes"><strong>Autor:</strong> <%= livro.getAutor() != null ? livro.getAutor() : "N/A" %></p>
                            <p class="livro-detalhes"><strong>ISBN:</strong> <%= livro.getIsbn() %></p>
                            <p class="livro-detalhes"><strong>Ano:</strong> <%= livro.getAnoPublicacao() %></p>

                            <div class="livro-acoes">
                                <a href="editar-livro.jsp?id=<%= livro.getId() %>">
                                    <i class="fas fa-edit"></i> Editar
                                </a>
                                <a href="excluir-livro?id=<%= livro.getId() %>" onclick="return confirm('Tem certeza que deseja excluir este livro?')">
                                    <i class="fas fa-trash"></i> Excluir
                                </a>
                            </div>
                        </div>
                    </div>
                <% } %>
            <% } %>
        </div>

        <footer>
            <p>Sistema de Biblioteca Digital &copy; <%= java.time.Year.now().getValue() %></p>
        </footer>
    </div>
</body>
</html>
