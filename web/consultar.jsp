<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Prueba de Conexión</title>
</head>
<body>
    <h1>Resultado de la Prueba de Conexión</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Edad</th>
            <th>Email</th>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registroalumnos3", "root", "leon2910");
                stmt = conn.createStatement();
                String sql = "SELECT id_usu, nom_usu, appat_usu, apmat_usu, edad_usu, email_usu FROM alumnos";
                rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    int id = rs.getInt("id_usu");
                    String nombre = rs.getString("nom_usu");
                    String appat = rs.getString("appat_usu");
                    String apmat = rs.getString("apmat_usu");
                    int edad = rs.getInt("edad_usu");
                    String email = rs.getString("email_usu");

                    out.println("<tr>");
                    out.println("<td>" + id + "</td>");
                    out.println("<td>" + nombre + "</td>");
                    out.println("<td>" + appat + "</td>");
                    out.println("<td>" + apmat + "</td>");
                    out.println("<td>" + edad + "</td>");
                    out.println("<td>" + email + "</td>");
                    out.println("</tr>");
                }
            } catch (ClassNotFoundException e) {
                out.println("<p>Error: Driver no encontrado - " + e.getMessage() + "</p>");
            } catch (SQLException e) {
                out.println("<p>Error: No se pudo obtener la lista - " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("<p>Error al cerrar la conexión - " + e.getMessage() + "</p>");
                }
            }
        %>
    </table>
</body>
</html>
