<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Categoria</title>
    <style>
        body { font-family: sans-serif; background: #f5f5f5; padding: 20px; }
        form { background: white; padding: 20px; border-radius: 8px; max-width: 400px; margin: auto; }
        input[type="text"] { width: 100%; padding: 10px; margin-bottom: 12px; }
        button { padding: 10px 16px; background: #27ae60; color: white; border: none; border-radius: 4px; }
        a { display: block; margin-top: 10px; text-align: center; }
    </style>
</head>
<body>
    <h1 style="text-align:center;">Nova Categoria</h1>
    <form method="post" action="categoria">
        <input type="hidden" name="acao" value="salvar">
        <label>Nome:</label>
        <input type="text" name="nome" required>
        <button type="submit">Salvar</button>
        <a href="categoria">← Voltar</a>
    </form>
</body>
</html>
