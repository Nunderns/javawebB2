package dao;

import model.Emprestimo;
import util.Conexao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmprestimoDAO {

    public void salvar(Emprestimo e) {
        String sql = "INSERT INTO emprestimos (id_livro, id_usuario, data_emprestimo, data_devolucao) VALUES (?, ?, ?, ?)";
        try (Connection conn = Conexao.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, e.getIdLivro());
            stmt.setInt(2, e.getIdUsuario());
            stmt.setDate(3, new java.sql.Date(e.getDataEmprestimo().getTime()));
            stmt.setDate(4, new java.sql.Date(e.getDataDevolucao().getTime()));
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Emprestimo> listarTodos() {
        List<Emprestimo> lista = new ArrayList<>();
        String sql = "SELECT * FROM emprestimos";
        try (Connection conn = Conexao.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Emprestimo e = new Emprestimo();
                e.setId(rs.getInt("id"));
                e.setIdLivro(rs.getInt("id_livro"));
                e.setIdUsuario(rs.getInt("id_usuario"));
                e.setDataEmprestimo(rs.getDate("data_emprestimo"));
                e.setDataDevolucao(rs.getDate("data_devolucao"));
                lista.add(e);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return lista;
    }
}
