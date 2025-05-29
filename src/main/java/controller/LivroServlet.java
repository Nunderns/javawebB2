package controller;

import dao.LivroDAO;
import model.Livro;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class LivroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L; // ✅ corrigido

    private LivroDAO dao = new LivroDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        dao.salvar(new Livro(0, titulo, autor));
        response.sendRedirect("livros");
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
