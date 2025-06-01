package dao;

import model.Categoria;
import util.Conexao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    public List<Categoria> listarTodas() {
        List<Categoria> categorias = new ArrayList<>();
        String sql = "SELECT * FROM categorias ORDER BY nome";

        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Categoria c = new Categoria();
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                categorias.add(c);
            }

        } catch (SQLException e) {
            System.err.println("❌ Erro ao listar categorias: " + e.getMessage());
        }

        return categorias;
    }

    public void salvar(Categoria categoria) {
        String sql = "INSERT INTO categorias (nome) VALUES (?)";

        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, categoria.getNome());
            stmt.executeUpdate();
            System.out.println("✅ Categoria salva com sucesso.");

        } catch (SQLException e) {
            System.err.println("❌ Erro ao salvar categoria: " + e.getMessage());
        }
    }

    public void atualizar(Categoria categoria) {
        String sql = "UPDATE categorias SET nome = ? WHERE id = ?";

        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, categoria.getNome());
            stmt.setInt(2, categoria.getId());
            stmt.executeUpdate();
            System.out.println("✅ Categoria atualizada com sucesso.");

        } catch (SQLException e) {
            System.err.println("❌ Erro ao atualizar categoria: " + e.getMessage());
        }
    }

    public void excluir(int id) {
        String sql = "DELETE FROM categorias WHERE id = ?";

        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();
            System.out.println("✅ Categoria excluída com sucesso.");

        } catch (SQLException e) {
            System.err.println("❌ Erro ao excluir categoria: " + e.getMessage());
        }
    }

    public Categoria buscarPorId(int id) {
        String sql = "SELECT * FROM categorias WHERE id = ?";
        Categoria categoria = null;

        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                categoria = new Categoria();
                categoria.setId(rs.getInt("id"));
                categoria.setNome(rs.getString("nome"));
            }

        } catch (SQLException e) {
            System.err.println("❌ Erro ao buscar categoria: " + e.getMessage());
        }

        return categoria;
    }
}
