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
      --primary-color: #4361ee;
      --primary-hover: #3a56d4;
      --secondary-color: #f72585;
      --text-color: #2b2d42;
      --light-gray: #f8f9fa;
      --medium-gray: #e9ecef;
      --dark-gray: #6c757d;
      --success-color: #4cc9f0;
      --border-radius: 8px;
      --box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      --transition: all 0.3s ease;
    }
    
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: 100vh;
      padding: 20px;
    }

    .register-container {
      background: #fff;
      padding: 2.5rem;
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
      width: 100%;
      max-width: 450px;
      transition: var(--transition);
      border: 1px solid var(--medium-gray);
    }

    .register-container:hover {
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
    }

    .register-header {
      text-align: center;
      margin-bottom: 2rem;
    }

    .register-header h2 {
      color: var(--text-color);
      font-weight: 600;
      margin-bottom: 0.5rem;
      font-size: 1.8rem;
    }

    .register-header p {
      color: var(--dark-gray);
      font-size: 0.9rem;
    }

    .form-group {
      margin-bottom: 1.5rem;
      position: relative;
    }

    label {
      display: block;
      margin-bottom: 0.5rem;
      color: var(--text-color);
      font-weight: 500;
      font-size: 0.9rem;
    }

    .input-field {
      position: relative;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 0.8rem 1rem 0.8rem 2.5rem;
      border-radius: var(--border-radius);
      border: 1px solid var(--medium-gray);
      font-size: 0.95rem;
      transition: var(--transition);
      background-color: var(--light-gray);
    }

    input:focus {
      outline: none;
      border-color: var(--primary-color);
      box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
      background-color: #fff;
    }

    .input-icon {
      position: absolute;
      left: 1rem;
      top: 50%;
      transform: translateY(-50%);
      color: var(--dark-gray);
      font-size: 1rem;
    }

    .btn-register {
      background-color: var(--primary-color);
      color: white;
      border: none;
      padding: 0.8rem;
      width: 100%;
      border-radius: var(--border-radius);
      font-weight: 500;
      cursor: pointer;
      transition: var(--transition);
      font-size: 1rem;
      margin-top: 0.5rem;
      letter-spacing: 0.5px;
    }

    .btn-register:hover {
      background-color: var(--primary-hover);
      transform: translateY(-2px);
    }

    .footer-text {
      margin-top: 1.5rem;
      text-align: center;
      font-size: 0.9rem;
      color: var(--dark-gray);
    }

    .footer-text a {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 500;
      transition: var(--transition);
    }

    .footer-text a:hover {
      color: var(--primary-hover);
      text-decoration: underline;
    }

    .password-strength {
      margin-top: 0.5rem;
      height: 4px;
      background-color: var(--medium-gray);
      border-radius: 2px;
      overflow: hidden;
    }

    .strength-bar {
      height: 100%;
      width: 0;
      background-color: var(--success-color);
      transition: var(--transition);
    }

    @media (max-width: 480px) {
      .register-container {
        padding: 1.5rem;
      }
      
      .register-header h2 {
        font-size: 1.5rem;
      }
    }
  </style>
</head>
<body>

  <div class="register-container">
    <div class="register-header">
      <h2>Crie sua conta</h2>
      <p>Preencha os campos abaixo para se cadastrar</p>
    </div>
    
    <form action="RegisterServlet" method="post">
      <div class="form-group">
        <label for="nome">Nome completo</label>
        <div class="input-field">
          <i class="input-icon">👤</i>
          <input type="text" id="nome" name="nome" placeholder="Digite seu nome completo" required>
        </div>
      </div>

      <div class="form-group">
        <label for="email">E-mail</label>
        <div class="input-field">
          <i class="input-icon">✉️</i>
          <input type="email" id="email" name="email" placeholder="seu@email.com" required>
        </div>
      </div>

      <div class="form-group">
        <label for="senha">Senha</label>
        <div class="input-field">
          <i class="input-icon">🔒</i>
          <input type="password" id="senha" name="senha" placeholder="Crie uma senha segura" required>
        </div>
        <div class="password-strength">
          <div class="strength-bar" id="strength-bar"></div>
        </div>
      </div>

      <button type="submit" class="btn-register">Cadastrar</button>
    </form>

    <p class="footer-text">Já possui uma conta? <a href="login.jsp">Entrar agora</a></p>
  </div>

  <script>
    // Efeito simples de força da senha
    const passwordInput = document.getElementById('senha');
    const strengthBar = document.getElementById('strength-bar');
    
    passwordInput.addEventListener('input', function() {
      const password = this.value;
      let strength = 0;
      
      if (password.length > 0) strength += 20;
      if (password.length >= 6) strength += 20;
      if (password.match(/[a-z]/) && password.match(/[A-Z]/)) strength += 20;
      if (password.match(/\d/)) strength += 20;
      if (password.match(/[^a-zA-Z\d]/)) strength += 20;
      
      strengthBar.style.width = strength + '%';
      
      if (strength < 40) {
        strengthBar.style.backgroundColor = '#ef233c';
      } else if (strength < 80) {
        strengthBar.style.backgroundColor = '#ffbe0b';
      } else {
        strengthBar.style.backgroundColor = '#4cc9f0';
      }
    });
  </script>

</body>
</html>