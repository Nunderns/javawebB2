<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Novo Empréstimo</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3a0ca3;
            --success-color: #4cc9f0;
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
            padding: 0;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        header {
            margin-bottom: 2rem;
            text-align: center;
        }
        
        h1 {
            font-size: 2rem;
            color: var(--dark-color);
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            margin-bottom: 1rem;
        }
        
        h1 i {
            color: var(--primary-color);
        }
        
        .card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 2rem;
            margin-bottom: 1.5rem;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--dark-color);
        }
        
        input[type="number"],
        input[type="date"],
        input[type="text"],
        select {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: var(--border-radius);
            font-family: 'Poppins', sans-serif;
            font-size: 1rem;
            transition: var(--transition);
        }
        
        input[type="number"]:focus,
        input[type="date"]:focus,
        input[type="text"]:focus,
        select:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0.8rem 1.5rem;
            border-radius: var(--border-radius);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
            font-size: 1rem;
            border: none;
            cursor: pointer;
            width: 100%;
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
            justify-content: center;
            margin-top: 1rem;
            transition: var(--transition);
            font-weight: 500;
            padding: 0.6rem 1rem;
            border-radius: var(--border-radius);
        }
        
        .btn-back:hover {
            color: var(--secondary-color);
            background-color: rgba(67, 97, 238, 0.1);
        }
        
        .btn-back i {
            margin-right: 0.5rem;
        }
        
        .form-actions {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            
            h1 {
                font-size: 1.5rem;
            }
            
            .card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1><i class="fas fa-book"></i> Registrar Novo Empréstimo</h1>
        </header>
        
        <div class="card">
            <form method="post" action="../emprestimo">
                <div class="form-group">
                    <label for="id_livro"><i class="fas fa-book"></i> ID do Livro:</label>
                    <input type="number" id="id_livro" name="id_livro" required>
                </div>
                
                <div class="form-group">
                    <label for="id_usuario"><i class="fas fa-user"></i> ID do Usuário:</label>
                    <input type="number" id="id_usuario" name="id_usuario" required>
                </div>
                
                <div class="form-group">
                    <label for="data_emprestimo"><i class="fas fa-calendar-alt"></i> Data do Empréstimo:</label>
                    <input type="date" id="data_emprestimo" name="data_emprestimo" required>
                </div>
                
                <div class="form-group">
                    <label for="data_devolucao"><i class="fas fa-calendar-check"></i> Data de Devolução:</label>
                    <input type="date" id="data_devolucao" name="data_devolucao" required>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Salvar Empréstimo
                    </button>
                </div>
            </form>
        </div>
        
        <a href="../emprestimo" class="btn-back">
            <i class="fas fa-arrow-left"></i> Voltar para Lista de Empréstimos
        </a>
    </div>
</body>
</html>