package controller;

import dao.UsuarioDAO;
import model.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if (nome == null || email == null || senha == null ||
            nome.isEmpty() || email.isEmpty() || senha.isEmpty()) {
            request.setAttribute("erro", "Preencha todos os campos corretamente.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
            return;
        }

        Usuario usuario = new Usuario();
        usuario.setNome(nome);
        usuario.setEmail(email);
        usuario.setSenha(senha);
        usuario.setTipo("Estudante");

        UsuarioDAO dao = new UsuarioDAO();
        dao.salvar(usuario);

        request.setAttribute("sucesso", "Cadastro realizado com sucesso! Faça login.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }
}
