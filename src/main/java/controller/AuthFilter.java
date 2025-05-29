package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AuthFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String path = req.getRequestURI();
        HttpSession session = req.getSession(false);

        boolean isLoggedIn = (session != null && session.getAttribute("usuario") != null);
        boolean isLoginPage = path.endsWith("login.jsp") || path.endsWith("LoginServlet") || path.endsWith("register.jsp") || path.endsWith("RegisterServlet");

        if (isLoggedIn || isLoginPage || path.contains("css") || path.contains("js")) {
            chain.doFilter(request, response); // libera acesso
        } else {
            res.sendRedirect("login.jsp"); // redireciona
        }
    }

    public void init(FilterConfig fConfig) {}
    public void destroy() {}
}
