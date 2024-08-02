<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
    String nombre = request.getParameter("nombre");
    String appat = request.getParameter("appat");
    String apmat = request.getParameter("apmat");
    int edad = Integer.parseInt(request.getParameter("edad"));
    String email = request.getParameter("email");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver"); // Asegúrate de tener el driver adecuado
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registroalumnos3", "root", "leon2910"); // Actualiza con tu usuario y contraseña de la base de datos

        String sql = "INSERT INTO registroalumnos3 (nom_usu, appat_usu, apmat_usu, edad_usu, email_usu) VALUES (?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, nombre);
        pstmt.setString(2, appat);
        pstmt.setString(3, apmat);
        pstmt.setInt(4, edad);
        pstmt.setString(5, email);

        int row = pstmt.executeUpdate();

        if (row > 0) {
            out.println("<p>Alumno registrado exitosamente!</p>");
        } else {
            out.println("<p>Ocurrió un error al registrar al alumno. Por favor, intenta de nuevo.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<a href="inicio.jsp">Volver a la lista de alumnos</a>
