<%@ page import="java.util.List" %>
<%@ page import="model.Livro" %>
<%@ page import="model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Livro> livros = (List<Livro>) request.getAttribute("livros");
    String mensagem = (String) request.getAttribute("mensagem");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catálogo de Livros</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #4f46e5;
            --primary-light: #6366f1;
            --primary-dark: #4338ca;
            --text: #1f2937;
            --text-light: #6b7280;
            --background: #f9fafb;
            --white: #ffffff;
            --gray-light: #e5e7eb;
            --gray: #d1d5db;
            --success: #10b981;
            --danger: #ef4444;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-md: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --radius: 0.5rem;
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
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--gray-light);
        }

        h1 {
            color: var(--primary);
            font-size: 2rem;
            font-weight: 600;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            padding: 0.625rem 1.25rem;
            border-radius: var(--radius);
            font-weight: 500;
            text-decoration: none;
            transition: all 0.2s ease;
            cursor: pointer;
        }

        .btn-primary {
            background-color: var(--primary);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            transform: translateY(-1px);
            box-shadow: var(--shadow);
        }

        .btn i {
            margin-right: 0.5rem;
        }

        .alert {
            padding: 1rem;
            border-radius: var(--radius);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }

        .alert-success {
            background-color: rgba(16, 185, 129, 0.1);
            color: var(--success);
            border-left: 4px solid var(--success);
        }

        .livros-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .livro-card {
            background-color: var(--white);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            transition: all 0.3s ease;
        }

        .livro-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-md);
        }

        .livro-imagem {
            height: 180px;
            background-color: var(--gray-light);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-light);
        }

        .livro-imagem i {
            font-size: 3rem;
            opacity: 0.5;
        }

        .livro-info {
            padding: 1.25rem;
        }

        .livro-titulo {
            font-size: 1.125rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--primary);
        }

        .livro-detalhes {
            font-size: 0.875rem;
            color: var(--text-light);
            margin-bottom: 0.25rem;
        }

        .livro-acoes {
            display: flex;
            justify-content: space-between;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 1px solid var(--gray-light);
        }

        .livro-acoes a {
            color: var(--primary);
            font-size: 0.875rem;
            text-decoration: none;
            transition: color 0.2s;
        }

        .livro-acoes a:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        .empty-state {
            text-align: center;
            padding: 3rem;
            color: var(--text-light);
            grid-column: 1 / -1;
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: var(--gray);
        }

        .empty-state h3 {
            font-size: 1.25rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
            color: var(--text);
        }

        footer {
            text-align: center;
            margin-top: 3rem;
            padding-top: 2rem;
            border-top: 1px solid var(--gray-light);
            color: var(--text-light);
            font-size: 0.875rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1.5rem;
            }
            
            header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
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
            <a href="adicionar-livro.jsp" class="btn btn-primary">
                <i class="fas fa-plus"></i> Adicionar Livro
            </a>
        </header>

        <% if (mensagem != null) { %>
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> <%= mensagem %>
            </div>
        <% } %>

        <div class="livros-grid">
            <% if (livros == null || livros.isEmpty()) { %>
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
                            <p class="livro-detalhes"><strong>Autor:</strong> <%= livro.getAutor() %></p>
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