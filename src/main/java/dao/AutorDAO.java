package dao;

import model.Autor;
import java.sql.*;
import java.util.*;

public class AutorDAO {
    private Connection connection;

    public AutorDAO(Connection connection) {
        this.connection = connection;
    }

    public void inserir(Autor autor) throws SQLException {
        String sql = "INSERT INTO autores (nome) VALUES (?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, autor.getNome());
        stmt.executeUpdate();
        stmt.close();
    }

    public List<Autor> listarTodos() throws SQLException {
        List<Autor> autores = new ArrayList<>();
        String sql = "SELECT * FROM autores";
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            Autor autor = new Autor(rs.getInt("id"), rs.getString("nome"));
            autores.add(autor);
        }
        rs.close();
        stmt.close();
        return autores;
    }

    public void excluir(int id) throws SQLException {
        String sql = "DELETE FROM autores WHERE id = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setInt(1, id);
        stmt.executeUpdate();
        stmt.close();
    }
}
