package controller;

import dao.UsuarioDAO;
import model.Usuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UsuarioDAO dao = new UsuarioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        // Evita erro ao acessar diretamente via navegador
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Usuario novoUsuario = new Usuario(nome, email, senha);
        dao.salvar(novoUsuario);

        response.sendRedirect("index.html"); // ou index.jsp
    }
}
