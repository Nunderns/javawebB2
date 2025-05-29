package dao;

import model.Livro;
import util.Conexao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LivroDAO {

    public void salvar(Livro livro) {
        String sql = "INSERT INTO livros (titulo, autor) VALUES (?, ?)";

        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, livro.getTitulo());
            stmt.setString(2, livro.getAutor());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Livro> listarTodos() {
        List<Livro> livros = new ArrayList<>();
        String sql = "SELECT * FROM livros";

        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Livro livro = new Livro();
                livro.setId(rs.getInt("id"));
                livro.setTitulo(rs.getString("titulo"));
                livro.setAutor(rs.getString("autor"));
                livros.add(livro);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return livros;
    }
}
