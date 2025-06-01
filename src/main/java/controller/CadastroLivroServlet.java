package controller;

import dao.CategoriaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import model.Categoria;

@WebServlet("/adicionar-livro")
public class CadastroLivroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CategoriaDAO categoriaDAO = new CategoriaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Categoria> categorias = categoriaDAO.listarTodas();
        request.setAttribute("categorias", categorias);

        request.getRequestDispatcher("adicionar-livro.jsp").forward(request, response);
    }
}
