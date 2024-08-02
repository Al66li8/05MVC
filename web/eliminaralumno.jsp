<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Alumno, Controlador.AccionesAlumno" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Alumno</title>
    <style>
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            color: #fff;
            background-color: #007BFF;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Eliminar Alumno</h1>
        <%
            // Obtener el ID del parámetro
            int id = Integer.parseInt(request.getParameter("id"));

            // Buscar el alumno por ID
            Alumno alu = AccionesAlumno.buscarAlumnoById(id);
        %>
        <form method="post" action="eliminarAlumno">
            <table>
                <tr>
                    <td>ID:</td>
                    <td><%= alu.getIdalumno() %></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td><%= alu.getNombre() %></td>
                </tr>
                <tr>
                    <td>Apellido Paterno:</td>
                    <td><%= alu.getApellidoPaterno() %></td>
                </tr>
                <tr>
                    <td>Apellido Materno:</td>
                    <td><%= alu.getApellidoMaterno() %></td>
                </tr>
                <tr>
                    <td>Edad:</td>
                    <td><%= alu.getEdad() %></td>
                </tr>
                <tr>
                    <td>Correo:</td>
                    <td><%= alu.getCorreo() %></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="hidden" name="id" value="<%= alu.getIdalumno() %>">
                        <input type="submit" value="Eliminar" class="button">
                    </td>
                </tr>
            </table>
        </form>
        <br>
        <a href="inicio.jsp" class="button">Volver</a>
    </div>
</body>
</html>
