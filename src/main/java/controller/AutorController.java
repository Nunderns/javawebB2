package controller;

import dao.AutorDAO;
import model.Autor;
import util.Conexao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class AutorController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        try (Connection conn = Conexao.getConnection()) {
            AutorDAO dao = new AutorDAO(conn);

            if ("listar".equals(acao)) {
                List<Autor> lista = dao.listarTodos();
                request.setAttribute("autores", lista);
                request.getRequestDispatcher("/Autor/listar-autores.jsp").forward(request, response);
            } else if ("excluir".equals(acao)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.excluir(id);
                response.sendRedirect("autor?acao=listar");
            }
        } catch (Exception e) {
            throw new ServletException("Erro no controlador de autores", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");

        try (Connection conn = Conexao.getConnection()) {
            AutorDAO dao = new AutorDAO(conn);
            dao.inserir(new Autor(nome));
            response.sendRedirect("autor?acao=listar");

        } catch (Exception e) {
            throw new ServletException("Erro ao inserir autor", e);
        }
    }
}
