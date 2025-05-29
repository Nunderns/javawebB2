package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
    public static Connection getConnection() {
        try {
            String url = "jdbc:mysql://localhost:3306/biblioteca";
            String usuario = "root";
            String senha = "root";
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(url, usuario, senha);
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
            return null;
        }
    }
}
