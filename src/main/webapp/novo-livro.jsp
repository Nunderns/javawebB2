<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Novo Livro</title>
</head>
<body>
    <h2>Cadastrar Novo Livro</h2>
    <form action="livros" method="post">
        <label for="titulo">Título:</label><br>
        <input type="text" name="titulo" required><br><br>

        <label for="autor">Autor:</label><br>
        <input type="text" name="autor" required><br><br>

        <button type="submit">Salvar</button>
    </form>
</body>
</html>
