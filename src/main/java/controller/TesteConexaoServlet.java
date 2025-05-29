package controller;

import util.Conexao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class TesteConexaoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            if (Conexao.getConnection() != null) {
                out.println("<html><body>");
                out.println("<h2 style='color:green;'>✅ Conectado com sucesso ao banco de dados!</h2>");
                out.println("</body></html>");
            } else {
                out.println("<html><body>");
                out.println("<h2 style='color:red;'>❌ Erro na conexão com o banco de dados.</h2>");
                out.println("</body></html>");
            }
        }
    }
}
