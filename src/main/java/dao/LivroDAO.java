package dao;

import model.Autor;
import model.Livro;
import util.Conexao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LivroDAO {

    public void salvar(Livro livro) {
        String sqlLivro = "INSERT INTO livros (titulo, isbn, ano_publicacao, id_categoria) VALUES (?, ?, ?, ?)";

        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmtLivro = conn.prepareStatement(sqlLivro, Statement.RETURN_GENERATED_KEYS)) {

            // Inserindo o livro
            stmtLivro.setString(1, livro.getTitulo());
            stmtLivro.setString(2, livro.getIsbn());
            stmtLivro.setInt(3, livro.getAnoPublicacao());
            stmtLivro.setInt(4, livro.getIdCategoria());
            stmtLivro.executeUpdate();

            // Recupera o ID do livro inserido
            ResultSet rs = stmtLivro.getGeneratedKeys();
            if (rs.next()) {
                int livroId = rs.getInt(1);

                // Inserindo os autores na tabela intermediária
                String sqlAutor = "INSERT INTO livro_autor (livro_id, autor_id) VALUES (?, ?)";
                for (Autor autor : livro.getAutores()) {
                    try (PreparedStatement stmtAutor = conn.prepareStatement(sqlAutor)) {
                        stmtAutor.setInt(1, livroId);
                        stmtAutor.setInt(2, autor.getId());
                        stmtAutor.executeUpdate();
                    }
                }

                System.out.println("✅ Livro e autores salvos com sucesso.");
            }

        } catch (SQLException e) {
            System.err.println("❌ Erro ao salvar livro com autores: " + e.getMessage());
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

                // Buscar autores desse livro
                livro.setAutores(buscarAutoresPorLivro(conn, livro.getId()));
                livros.add(livro);
            }

        } catch (SQLException e) {
            System.err.println("❌ Erro ao listar livros: " + e.getMessage());
            e.printStackTrace();
        }

        return livros;
    }

    private List<Autor> buscarAutoresPorLivro(Connection conn, int livroId) throws SQLException {
        List<Autor> autores = new ArrayList<>();
        String sql = "SELECT a.id, a.nome FROM autores a " +
                     "JOIN livro_autor la ON a.id = la.autor_id " +
                     "WHERE la.livro_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, livroId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    autores.add(new Autor(rs.getInt("id"), rs.getString("nome")));
                }
            }
        }

        return autores;
    }
}
