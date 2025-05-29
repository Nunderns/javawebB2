<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Usuário</title>
    <style>
        body {
            font-family: Arial;
            padding: 20px;
        }

        form {
            max-width: 400px;
            margin: auto;
        }

        label, input {
            display: block;
            margin-top: 10px;
        }

        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #219150;
        }
    </style>
</head>
<body>

    <h2>Cadastro de Novo Usuário</h2>
    <form action="RegisterServlet" method="post">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" required>

        <label for="email">E-mail:</label>
        <input type="email" name="email" required>

        <label for="senha">Senha:</label>
        <input type="password" name="senha" required>

        <button type="submit">Cadastrar</button>
    </form>

</body>
</html>
