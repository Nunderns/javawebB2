<%@ page import="model.Autor" %>
<%@ page import="java.util.List" %>
<%
    List<Autor> autores = (List<Autor>) request.getAttribute("autores");
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Autores</title>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2980b9;
            --background-color: #f8f9fa;
            --text-color: #333;
            --border-color: #ddd;
            --table-header-bg: #f1f5f9;
            --table-row-even: #ffffff;
            --table-row-odd: #f9f9f9;
            --danger-color: #e74c3c;
            --danger-hover: #c0392b;
            --info-color: #17a2b8;
            --info-hover: #138496;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
            padding: 20px;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        h1 {
            color: var(--primary-color);
            font-weight: 600;
            margin: 0;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            text-align: center;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            color: white;
        }
        
        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }
        
        .btn-danger {
            background-color: var(--danger-color);
            color: white;
            padding: 5px 10px;
            font-size: 14px;
        }
        
        .btn-danger:hover {
            background-color: var(--danger-hover);
        }
        
        .btn-info {
            background-color: var(--info-color);
            color: white;
        }
        
        .btn-info:hover {
            background-color: var(--info-hover);
        }
        
        .table-responsive {
            overflow-x: auto;
            margin-bottom: 30px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            min-width: 600px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
        }
        
        thead tr {
            background-color: var(--table-header-bg);
            color: var(--text-color);
            text-align: left;
            font-weight: 600;
        }
        
        th, td {
            padding: 15px 20px;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
        }
        
        tbody tr:nth-child(even) {
            background-color: var(--table-row-even);
        }
        
        tbody tr:nth-child(odd) {
            background-color: var(--table-row-odd);
        }
        
        tbody tr:hover {
            background-color: #f0f7ff;
        }
        
        .actions {
            display: flex;
            gap: 10px;
        }
        
        .empty-message {
            text-align: center;
            padding: 30px;
            color: #666;
            font-style: italic;
        }
        
        .footer-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 20px;
        }
        
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            th, td {
                padding: 12px 15px;
            }
            
            .footer-buttons {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Autores Cadastrados</h1>
            <a href="criar-autor.jsp" class="btn btn-primary">+ Novo Autor</a>
        </div>
        
        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome do Autor</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (autores != null && !autores.isEmpty()) { %>
                        <% for (Autor autor : autores) { %>
                            <tr>
                                <td><%= autor.getId() %></td>
                                <td><%= autor.getNome() %></td>
                                <td class="actions">
                                    <a href="autor?acao=excluir&id=<%= autor.getId() %>" 
                                       class="btn btn-danger"
                                       onclick="return confirm('Tem certeza que deseja excluir este autor?')">Excluir</a>
                                </td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="3" class="empty-message">Nenhum autor cadastrado</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        
        <div class="footer-buttons">
			<a href="<%= request.getContextPath() %>/index.jsp" class="btn btn-info">Voltar ao Início</a>
        </div>
    </div>

    <script>
        document.querySelectorAll('.btn-danger').forEach(btn => {
            btn.addEventListener('click', function(e) {
                if (!confirm('Tem certeza que deseja excluir este autor?')) {
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>