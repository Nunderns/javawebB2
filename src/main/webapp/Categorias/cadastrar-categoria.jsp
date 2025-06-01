<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Categoria</title>
    <style>
        body {
            font-family: sans-serif;
            background: #f5f5f5;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        form {
            background: white;
            padding: 30px 20px;
            border-radius: 8px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        label {
            font-weight: 600;
            color: #34495e;
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-bottom: 16px;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #27ae60;
            color: white;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background: #219150;
        }

        .back-link {
            display: block;
            margin-top: 15px;
            text-align: center;
            font-size: 0.95rem;
        }

        .back-link a {
            color: #2980b9;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form method="post" action="../categoria">
        <h1>Nova Categoria</h1>
        <input type="hidden" name="acao" value="salvar">
        
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required placeholder="Ex: Fantasia, História...">

        <button type="submit">Salvar Categoria</button>

        <div class="back-link">
            <a href="../categoria">← Voltar para a listagem</a>
        </div>
    </form>
</body>
</html>
