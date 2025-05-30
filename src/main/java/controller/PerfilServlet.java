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

        // int id = Integer.parseInt(request.getParameter("id")); // Não necessário se pegarmos o ID do usuário logado
        String email = request.getParameter("email");
        String novaSenha = request.getParameter("senha");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuarioAtualizado = new Usuario();
        usuarioAtualizado.setId(usuarioLogado.getId()); // Pega o ID do usuário da sessão
        usuarioAtualizado.setNome(usuarioLogado.getNome()); // Mantém o nome atual
        usuarioAtualizado.setEmail(email); // Define o novo email (se alterado)

        // Define a senha: se nova senha for fornecida, usa ela; caso contrário, mantém a senha atual do usuário logado
        if (novaSenha != null && !novaSenha.isEmpty()) {
            usuarioAtualizado.setSenha(novaSenha); // Ideal: aplicar hash na senha
        } else {
            usuarioAtualizado.setSenha(usuarioLogado.getSenha()); // Mantém a senha antiga
        }

        try {
            usuarioDAO.atualizar(usuarioAtualizado); // Método atualizar será criado no UsuarioDAO
            // Atualiza o objeto usuário na sessão com os novos dados
            session.setAttribute("usuario", usuarioAtualizado);
            response.sendRedirect("perfil.jsp?sucesso=Perfil atualizado com sucesso!");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erro", "Erro ao atualizar perfil: " + e.getMessage());
            request.getRequestDispatcher("perfil.jsp").forward(request, response);
        }
    }
} 