package controller;

import dao.CategoriaDAO;
import model.Categoria;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/categoria")
public class CategoriaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CategoriaDAO dao = new CategoriaDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if ("editar".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Categoria categoria = dao.buscarPorId(id);
            request.setAttribute("categoria", categoria);
            request.getRequestDispatcher("Categorias/editar-categoria.jsp").forward(request, response);
        } else if ("excluir".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.excluir(id);
            response.sendRedirect("categoria");
        } else {
            List<Categoria> categorias = dao.listarTodas();
            request.setAttribute("categorias", categorias);
            request.getRequestDispatcher("Categorias/listar-categorias.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        String nome = request.getParameter("nome");

        if ("salvar".equals(acao)) {
            dao.salvar(new Categoria(0, nome));
        } else if ("atualizar".equals(acao)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.atualizar(new Categoria(id, nome));
        }

        response.sendRedirect("categoria");
    }
}
