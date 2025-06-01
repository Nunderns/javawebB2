package controller;

import dao.EmprestimoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Emprestimo;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet("/emprestimo")
public class EmprestimoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final EmprestimoDAO dao = new EmprestimoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Emprestimo> emprestimos = dao.listarTodos();
        request.setAttribute("emprestimos", emprestimos);
        request.getRequestDispatcher("Emprestimos/listar-emprestimos.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idLivro = Integer.parseInt(request.getParameter("id_livro"));
            int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dataEmprestimo = sdf.parse(request.getParameter("data_emprestimo"));
            Date dataDevolucao = sdf.parse(request.getParameter("data_devolucao"));

            Emprestimo e = new Emprestimo(0, idLivro, idUsuario, dataEmprestimo, dataDevolucao);
            dao.salvar(e);
            response.sendRedirect("emprestimo");

        } catch (Exception ex) {
            ex.printStackTrace();
            response.getWriter().write("Erro ao registrar empréstimo.");
        }
    }
}
