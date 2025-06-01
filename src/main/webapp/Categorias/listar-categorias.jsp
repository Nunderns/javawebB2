<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Categoria" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Categorias</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --success-color: #4cc9f0;
            --danger-color: #f72585;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --border-radius: 8px;
            --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f7fa;
            color: #333;
            line-height: 1.6;
            padding: 0;
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
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #e0e0e0;
        }
        
        h1 {
            font-size: 2rem;
            color: var(--dark-color);
            font-weight: 600;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            padding: 0.6rem 1.2rem;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            font-size: 0.9rem;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            box-shadow: var(--box-shadow);
        }
        
        .btn i {
            margin-right: 0.5rem;
        }
        
        .btn-back {
            color: var(--primary-color);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            margin-top: 1.5rem;
            transition: var(--transition);
        }
        
        .btn-back:hover {
            color: var(--secondary-color);
        }
        
        .btn-back i {
            margin-right: 0.5rem;
        }
        
        .table-container {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 1rem;
            text-align: left;
        }
        
        th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 0.5px;
        }
        
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        tr:hover {
            background-color: #e9ecef;
        }
        
        .empty-row td {
            text-align: center;
            padding: 2rem;
            color: #6c757d;
        }
        
        .actions {
            display: flex;
            gap: 0.5rem;
        }
        
        .action-btn {
            padding: 0.4rem 0.8rem;
            border-radius: 4px;
            text-decoration: none;
            font-size: 0.8rem;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
        }
        
        .edit-btn {
            background-color: var(--success-color);
            color: white;
        }
        
        .edit-btn:hover {
            background-color: #38b6db;
        }
        
        .delete-btn {
            background-color: var(--danger-color);
            color: white;
        }
        
        .delete-btn:hover {
            background-color: #e5177e;
        }
        
        .action-btn i {
            margin-right: 0.3rem;
            font-size: 0.7rem;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            
            header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            
            table {
                display: block;
                overflow-x: auto;
            }
            
            .actions {
                flex-direction: column;
                gap: 0.3rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1><i class="fas fa-tags"></i> Gerenciamento de Categorias</h1>
            <a href="Categorias/cadastrar-categoria.jsp" class="btn btn-primary">
                <i class="fas fa-plus"></i> Nova Categoria
            </a>
        </header>
        
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
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
                            <a href="categoria?acao=editar&id=<%= c.getId() %>" class="action-btn edit-btn">
                                <i class="fas fa-edit"></i> Editar
                            </a>
                            <a href="categoria?acao=excluir&id=<%= c.getId() %>" class="action-btn delete-btn" 
                               onclick="return confirm('Tem certeza que deseja excluir esta categoria?')">
                                <i class="fas fa-trash-alt"></i> Excluir
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr class="empty-row">
                        <td colspan="3">
                            <i class="fas fa-inbox"></i> Nenhuma categoria encontrada
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        
        <a href="index.jsp" class="btn-back">
            <i class="fas fa-arrow-left"></i> Voltar para o início
        </a>
    </div>
</body>
</html>