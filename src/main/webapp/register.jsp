<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Cadastro - Biblioteca</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
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

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background-color: var(--background);
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      padding: 20px;
    }

    .register-container {
      background: #fff;
      padding: 2rem;
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      width: 100%;
      max-width: 420px;
      border: 1px solid var(--border);
    }

    .register-header {
      text-align: center;
      margin-bottom: 1.5rem;
    }

    .register-header h2 {
      font-size: 1.8rem;
      color: var(--text);
      font-weight: 600;
    }

    .register-header p {
      font-size: 0.9rem;
      color: var(--gray);
      margin-top: 0.3rem;
    }

    .form-group {
      margin-bottom: 1.2rem;
    }

    label {
      font-weight: 500;
      font-size: 0.9rem;
      color: var(--text);
      display: block;
      margin-bottom: 0.4rem;
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
      transition: 0.2s ease;
    }

    input:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
      background: #fff;
    }

    .btn-register {
      background-color: var(--primary);
      color: white;
      border: none;
      padding: 0.9rem;
      width: 100%;
      border-radius: var(--radius);
      font-size: 1rem;
      font-weight: 500;
      cursor: pointer;
      transition: 0.2s;
    }

    .btn-register:hover {
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

    .footer-text {
      text-align: center;
      margin-top: 1rem;
      font-size: 0.9rem;
      color: var(--gray);
    }

    .footer-text a {
      color: var(--primary);
      text-decoration: none;
      font-weight: 500;
    }

    .footer-text a:hover {
      text-decoration: underline;
    }

    .password-strength {
      margin-top: 0.4rem;
      height: 5px;
      background-color: #e5e7eb;
      border-radius: 3px;
      overflow: hidden;
    }

    .strength-bar {
      height: 100%;
      width: 0;
      background-color: var(--success);
      transition: width 0.3s ease;
    }
  </style>
</head>
<body>

  <div class="register-container">
    <div class="register-header">
      <h2>Crie sua conta</h2>
      <p>Preencha os campos abaixo para se cadastrar</p>
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

    <form action="register" method="post">
      <div class="form-group">
        <label for="nome">Nome completo</label>
        <input type="text" id="nome" name="nome" placeholder="Digite seu nome completo" required>
      </div>

      <div class="form-group">
        <label for="email">E-mail</label>
        <input type="email" id="email" name="email" placeholder="seu@email.com" required>
      </div>

      <div class="form-group">
        <label for="senha">Senha</label>
        <input type="password" id="senha" name="senha" placeholder="Crie uma senha segura" required>
        <div class="password-strength">
          <div class="strength-bar" id="strength-bar"></div>
        </div>
      </div>

      <button type="submit" class="btn-register">Cadastrar</button>
    </form>

    <p class="footer-text">Já possui uma conta? <a href="login.jsp">Entrar agora</a></p>
  </div>

  <script>
    const passwordInput = document.getElementById('senha');
    const strengthBar = document.getElementById('strength-bar');

    passwordInput.addEventListener('input', function () {
      const password = this.value;
      let strength = 0;

      if (password.length > 0) strength += 20;
      if (password.length >= 6) strength += 20;
      if (password.match(/[a-z]/) && password.match(/[A-Z]/)) strength += 20;
      if (password.match(/\d/)) strength += 20;
      if (password.match(/[^a-zA-Z\d]/)) strength += 20;

      strengthBar.style.width = strength + '%';

      if (strength < 40) {
        strengthBar.style.backgroundColor = '#ef4444';
      } else if (strength < 80) {
        strengthBar.style.backgroundColor = '#f59e0b';
      } else {
        strengthBar.style.backgroundColor = '#10b981';
      }
    });
  </script>

</body>
</html>
