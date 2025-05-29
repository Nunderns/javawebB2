package dao;

import model.Usuario;
import util.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {

    public Usuario autenticar(String email, String senha) {
        Usuario usuario = null;

        try (Connection con = Conexao.getConnection()) {
            String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, senha);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setSenha(rs.getString("senha"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario;
    }
}
