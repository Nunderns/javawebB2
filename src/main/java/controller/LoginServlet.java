package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp"); // redireciona se acessar via GET
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Simulação de login com usuário fixo
        if ("root".equals(username) && "root".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", username); // você pode usar um objeto Usuario se quiser
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp?erro=true");
        }
    }
}
