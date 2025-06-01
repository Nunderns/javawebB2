package controller;

import dao.UsuarioDAO;
import model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;

public class PerfilServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario usuarioLogado = (Usuario) session.getAttribute("usuario");

        if (usuarioLogado == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String email = request.getParameter("email");
        String novaSenha = request.getParameter("senha");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuarioAtualizado = new Usuario();
        usuarioAtualizado.setId(usuarioLogado.getId());
        usuarioAtualizado.setNome(usuarioLogado.getNome());
        usuarioAtualizado.setEmail(email);

        if (novaSenha != null && !novaSenha.isEmpty()) {
            usuarioAtualizado.setSenha(novaSenha);
        } else {
            usuarioAtualizado.setSenha(usuarioLogado.getSenha());
        }

        try {
            usuarioDAO.atualizar(usuarioAtualizado);
            session.setAttribute("usuario", usuarioAtualizado);
            response.sendRedirect("perfil.jsp?sucesso=Perfil atualizado com sucesso!");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro ao atualizar perfil: " + e.getMessage());
            request.getRequestDispatcher("perfil.jsp").forward(request, response);
        }
    }
} 