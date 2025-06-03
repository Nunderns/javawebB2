package controller;

import dao.AutorDAO;
import dao.LivroDAO;
import model.Autor;
import model.Livro;
import util.Conexao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
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
        String[] autorIds = request.getParameterValues("autores");

        if (titulo == null || isbn == null || anoStr == null || categoriaStr == null || autorIds == null ||
            titulo.isEmpty() || isbn.isEmpty() || anoStr.isEmpty() || categoriaStr.isEmpty()) {

            request.setAttribute("erro", "Todos os campos são obrigatórios, incluindo autores.");
            request.getRequestDispatcher("cadastro-livro.jsp").forward(request, response);
            return;
        }

        try {
            int anoPublicacao = Integer.parseInt(anoStr);
            int idCategoria = Integer.parseInt(categoriaStr);

            List<Autor> autores = new ArrayList<>();
            for (String autorId : autorIds) {
                autores.add(new Autor(Integer.parseInt(autorId), ""));
            }

            Livro livro = new Livro();
            livro.setTitulo(titulo);
            livro.setIsbn(isbn);
            livro.setAnoPublicacao(anoPublicacao);
            livro.setIdCategoria(idCategoria);
            livro.setAutores(autores);

            dao.salvar(livro);
            request.getSession().setAttribute("sucesso", "Livro cadastrado com sucesso!");
            response.sendRedirect(request.getContextPath() + "/livros");

        } catch (NumberFormatException e) {
            request.setAttribute("erro", "Ano, categoria e autores devem ser numéricos.");
            request.getRequestDispatcher("cadastro-livro.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Livro> lista = dao.listarTodos();
        request.setAttribute("livros", lista);

        try (Connection conn = Conexao.getConnection()) {
            List<Autor> autores = new AutorDAO(conn).listarTodos();
            request.setAttribute("autores", autores);
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("livros.jsp");
        rd.forward(request, response);
    }
}
