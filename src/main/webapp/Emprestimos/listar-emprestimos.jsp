<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Emprestimo" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Empréstimos</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3a0ca3;
            --success-color: #4cc9f0;
            --warning-color: #f8961e;
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
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            color: #333;
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
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #e0e0e0;
        }
        
        h1 {
            font-size: 2rem;
            color: var(--dark-color);
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        h1 i {
            color: var(--primary-color);
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
            border: none;
            cursor: pointer;
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
            font-weight: 500;
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
            margin-bottom: 1.5rem;
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
        
        .status-pendente {
            color: var(--warning-color);
            font-weight: 500;
        }
        
        .status-devolvido {
            color: var(--success-color);
            font-weight: 500;
        }
        
        .status-atrasado {
            color: var(--danger-color);
            font-weight: 500;
        }
        
        .empty-message {
            text-align: center;
            padding: 2rem;
            color: #6c757d;
            font-style: italic;
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
        
        .return-btn {
            background-color: var(--warning-color);
            color: white;
        }
        
        .return-btn:hover {
            background-color: #e68a19;
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
                flex-wrap: wrap;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1><i class="fas fa-book-open"></i> Empréstimos Registrados</h1>
            <a href="Emprestimos/cadastrar-emprestimo.jsp" class="btn btn-primary">
                <i class="fas fa-plus"></i> Novo Empréstimo
            </a>
        </header>
        
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Livro</th>
                        <th>Usuário</th>
                        <th>Data Empréstimo</th>
                        <th>Data Devolução</th>
                        <th>Status</th>
                        <th>Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Emprestimo> emprestimos = (List<Emprestimo>) request.getAttribute("emprestimos");
                        if (emprestimos != null && !emprestimos.isEmpty()) {
                            for (Emprestimo e : emprestimos) {
                                // Simulação de status (você deve implementar sua própria lógica)
                                String statusClass = "";
                                String statusText = "";
                                java.util.Date hoje = new java.util.Date();
                                
                                if (e.getDataDevolucao() == null) {
                                    statusClass = "status-pendente";
                                    statusText = "Pendente";
                                } else if (e.getDataDevolucao().before(hoje)) {
                                    statusClass = "status-atrasado";
                                    statusText = "Atrasado";
                                } else {
                                    statusClass = "status-devolvido";
                                    statusText = "Devolvido";
                                }
                    %>
                    <tr>
                        <td><%= e.getId() %></td>
                        <td>Livro #<%= e.getIdLivro() %></td>
                        <td>Usuário #<%= e.getIdUsuario() %></td>
                        <td><%= e.getDataEmprestimo() != null ? e.getDataEmprestimo().toString() : "N/A" %></td>
                        <td><%= e.getDataDevolucao() != null ? e.getDataDevolucao().toString() : "Pendente" %></td>
                        <td class="<%= statusClass %>"><%= statusText %></td>
                        <td class="actions">
                            <a href="#" class="action-btn edit-btn">
                                <i class="fas fa-edit"></i> Editar
                            </a>
                            <a href="#" class="action-btn return-btn">
                                <i class="fas fa-book"></i> Devolver
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="7" class="empty-message">
                            <i class="fas fa-inbox"></i> Nenhum empréstimo registrado
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