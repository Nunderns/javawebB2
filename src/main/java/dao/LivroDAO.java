package dao;

import model.Livro;
import util.Conexao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LivroDAO {

    public void salvar(Livro livro) {
        String sql = "INSERT INTO livros (titulo, isbn, ano_publicacao, id_categoria) VALUES (?, ?, ?, ?)";

        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, livro.getTitulo());
            stmt.setString(2, livro.getIsbn());
            stmt.setInt(3, livro.getAnoPublicacao());
            stmt.setInt(4, livro.getIdCategoria());

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                System.out.println("✅ Livro salvo com sucesso: " + livro.getTitulo());
            } else {
                System.out.println("⚠️ Nenhum livro foi salvo.");
            }

        } catch (SQLIntegrityConstraintViolationException e) {
            System.err.println("❌ Erro de integridade: ID da categoria inválido (chave estrangeira).");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("❌ Erro SQL ao salvar o livro: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("❌ Erro inesperado ao salvar o livro: " + e.getMessage());
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
                livro.setIsbn(rs.getString("isbn"));
                livro.setAnoPublicacao(rs.getInt("ano_publicacao"));
                livro.setIdCategoria(rs.getInt("id_categoria"));
                livros.add(livro);
            }

        } catch (SQLException e) {
            System.err.println("❌ Erro SQL ao listar livros: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("❌ Erro inesperado ao listar livros: " + e.getMessage());
            e.printStackTrace();
        }

        return livros;
    }
}
