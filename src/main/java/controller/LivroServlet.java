package controller;

import dao.LivroDAO;
import model.Livro;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

public class LivroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private LivroDAO dao = new LivroDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String titulo = request.getParameter("titulo");
        String isbn = request.getParameter("isbn");
        String anoStr = request.getParameter("ano_publicacao");
        String categoriaStr = request.getParameter("id_categoria");

        if (titulo == null || isbn == null || anoStr == null || categoriaStr == null ||
            titulo.isEmpty() || isbn.isEmpty() || anoStr.isEmpty() || categoriaStr.isEmpty()) {

            request.setAttribute("erro", "Todos os campos são obrigatórios.");
            request.getRequestDispatcher("cadastro-livro.jsp").forward(request, response); // ajuste correto aqui
            return;
        }

        try {
            int anoPublicacao = Integer.parseInt(anoStr);
            int idCategoria = Integer.parseInt(categoriaStr);

            Livro livro = new Livro(0, titulo, isbn, anoPublicacao, idCategoria);
            dao.salvar(livro);

            response.sendRedirect("livros"); // redireciona para listar os livros

        } catch (NumberFormatException e) {
            request.setAttribute("erro", "Ano de publicação e ID da categoria devem ser numéricos.");
            request.getRequestDispatcher("cadastro-livro.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Livro> lista = dao.listarTodos();
        request.setAttribute("livros", lista);
        RequestDispatcher rd = request.getRequestDispatcher("livros.jsp");
        rd.forward(request, response);
    }
}
