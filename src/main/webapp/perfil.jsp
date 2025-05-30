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
    <title>Meu Perfil - Biblioteca</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4f46e5;
            --primary-hover: #4338ca;
            --text: #1f2937;
            --border: #d1d5db;
            --background: #f9fafb;
            --danger: #ef4444;
            --success: #10b981;
            --gray: #6b7280;
            --input-bg: #f3f4f6;
            --radius: 8px;
            --shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--background);
            color: var(--text);
            padding-top: 70px;
        }

        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: var(--primary);
            color: white;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 1000;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .user-info span {
            font-weight: 500;
        }

        .logout-link {
            color: white;
            text-decoration: underline;
            font-size: 0.9rem;
        }

        .perfil-container {
            background: #fff;
            padding: 2rem;
            margin: 2rem auto;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            max-width: 460px;
            border: 1px solid var(--border);
        }

        .perfil-header {
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .perfil-header h2 {
            font-size: 1.8rem;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 1.2rem;
        }

        label {
            font-weight: 500;
            font-size: 0.9rem;
            margin-bottom: 0.4rem;
            display: block;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 0.75rem 1rem;
            border-radius: var(--radius);
            border: 1px solid var(--border);
            background-color: var(--input-bg);
            font-size: 0.95rem;
        }

        input:focus {
            outline: none;
            border-color: var(--primary);
            background: #fff;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        }

        .btn-update {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 0.9rem;
            width: 100%;
            border-radius: var(--radius);
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: 0.2s ease;
            margin-top: 0.5rem;
        }

        .btn-update:hover {
            background-color: var(--primary-hover);
        }

        .feedback-message {
            text-align: center;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .feedback-message.error {
            color: var(--danger);
        }

        .feedback-message.success {
            color: var(--success);
        }

        .back-link {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.9rem;
        }

        .back-link a {
            color: var(--gray);
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

<header>
    <h1><a href="index.jsp" style="color: white; text-decoration: none;">Biblioteca Digital</a></h1>
    <div class="user-info">
        <span><%= usuario.getNome() %></span>
        <a href="logout.jsp" class="logout-link">Sair</a>
    </div>
</header>

<div class="perfil-container">
    <div class="perfil-header">
        <h2>Meu Perfil</h2>
    </div>

    <% if (request.getAttribute("erro") != null) { %>
        <div class="feedback-message error">
            <%= request.getAttribute("erro") %>
        </div>
    <% } else if (request.getAttribute("sucesso") != null) { %>
        <div class="feedback-message success">
            <%= request.getAttribute("sucesso") %>
        </div>
    <% } %>

    <form action="PerfilServlet" method="post">
        <input type="hidden" name="id" value="<%= usuario.getId() %>">

        <div class="form-group">
            <label for="email">E-mail</label>
            <input type="email" id="email" name="email" value="<%= usuario.getEmail() %>" required>
        </div>

        <div class="form-group">
            <label for="senha">Nova Senha</label>
            <input type="password" id="senha" name="senha" placeholder="Deixe em branco para manter a senha atual">
        </div>

        <button type="submit" class="btn-update">Atualizar Perfil</button>
    </form>

    <div class="back-link">
        <a href="index.jsp">← Voltar para o Catálogo</a>
    </div>
</div>

</body>
</html>
