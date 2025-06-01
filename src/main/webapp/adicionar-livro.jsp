<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Categoria" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Cadastro de Livro - Biblioteca</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    * {
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
    }

    body {
      background: #ecf0f1;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      padding: 20px;
    }

    .form-container {
      background: #fff;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 480px;
    }

    h2 {
      text-align: center;
      color: #2c3e50;
      margin-bottom: 24px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-bottom: 8px;
      color: #34495e;
      font-weight: 600;
    }

    input, select {
      width: 100%;
      padding: 12px;
      border-radius: 6px;
      border: 1px solid #ccc;
      font-size: 1rem;
    }

    .btn {
      width: 100%;
      padding: 14px;
      background-color: #27ae60;
      color: white;
      border: none;
      border-radius: 6px;
      font-weight: bold;
      font-size: 1rem;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .btn:hover {
      background-color: #1e874b;
    }

    .back-link {
      text-align: center;
      margin-top: 16px;
    }

    .back-link a {
      color: #2980b9;
      text-decoration: none;
      font-size: 0.95rem;
    }

    .back-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="form-container">
    <h2>Cadastro de Livro</h2>
    <form method="post" action="livros">

      <div class="form-group">
        <label for="titulo">Título do Livro</label>
        <input type="text" id="titulo" name="titulo" required placeholder="Ex: Dom Casmurro" maxlength="100">
      </div>

      <div class="form-group">
        <label for="isbn">ISBN</label>
        <input type="number" id="isbn" name="isbn" required placeholder="Ex: 9788535925523" maxlength="20">
      </div>

      <div class="form-group">
        <label for="ano_publicacao">Ano de Publicação</label>
        <input type="number" id="ano_publicacao" name="ano_publicacao" required placeholder="Ex: 1899" min="1000" max="2099">
      </div>

      <div class="form-group">
        <label for="id_categoria">Categoria</label>
        <select name="id_categoria" id="id_categoria" required>
          <option value="">Selecione uma categoria</option>
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

            if (categorias != null && !categorias.isEmpty()) {
              for (Categoria cat : categorias) {
          %>
            <option value="<%= cat.getId() %>"><%= cat.getNome() %></option>
          <%
              }
            } else {
          %>
            <option value="" disabled>Nenhuma categoria disponível</option>
          <%
            }
          %>
        </select>
      </div>

      <button type="submit" class="btn">Cadastrar Livro</button>
    </form>

    <div class="back-link">
      <a href="index.jsp">← Voltar para o início</a>
    </div>
  </div>

</body>
</html>
