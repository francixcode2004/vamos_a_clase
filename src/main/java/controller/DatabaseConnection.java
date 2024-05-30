package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {
    private String driver = "org.postgresql.Driver";
    private String user = "postgres";
    private String pwd = "123456";
    private String url = "jdbc:postgresql://localhost:5432/vamos_clase";
    private Connection con;

    public DatabaseConnection() {
        try {
            // Load the PostgreSQL driver
            Class.forName(driver);
            // Connect to the database
            con = DriverManager.getConnection(url, user, pwd);
            System.out.println("Se conectó a la base de datos postgres");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Error creating connection: " + e.getMessage());
        }
    }

    public Connection getConexion() {
        return con;
    }

    public ResultSet consulta(String sql) throws SQLException {
        Statement st = null;
        ResultSet rs = null;
        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            // Important: Do not close the statement here
            return rs;
        } catch (SQLException e) {
            // Cleanup if something goes wrong
            if (st != null) st.close();
            throw e; // Rethrow the exception
        }
    }

    public void cerrar() {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error cerrando la conexión: " + e.getMessage());
        }
    }
}

