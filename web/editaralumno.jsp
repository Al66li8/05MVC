<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Alumno, Controlador.AccionesAlumno" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actualizar Datos del Estudiante</title>
    </head>
    <body>
        <div class="container">
            <form method="post" name="formulario" action="actualizarAlumno">
                <table border="2">
                    <%
                        // Obtener el ID del estudiante desde la solicitud
                        int id = Integer.parseInt(request.getParameter("id"));
                        
                        // Buscar al alumno por ID
                        Alumno alu = AccionesAlumno.buscarAlumnoById(id);
                    %>
                    <tr>
                        <td>ID</td>
                        <td><input type="hidden" name="id2" value="<%= alu.getIdalumno() %>"></td>
                    </tr>
                    <tr>
                        <td>Nombre</td>
                        <td><input type="text" name="nombre2" value="<%= alu.getNombre() %>"></td>
                    </tr>
                    <tr>
                        <td>Apellido Paterno</td>
                        <td><input type="text" name="apellidoPaterno2" value="<%= alu.getApellidoPaterno() %>"></td>
                    </tr>
                    <tr>
                        <td>Apellido Materno</td>
                        <td><input type="text" name="apellidoMaterno2" value="<%= alu.getApellidoMaterno() %>"></td>
                    </tr>
                    <tr>
                        <td>Edad</td>
                        <td><input type="text" name="edad2" value="<%= alu.getEdad() %>"></td>
                    </tr>
                    <tr>
                        <td>Correo</td>
                        <td><input type="text" name="correo2" value="<%= alu.getCorreo() %>"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Actualizar Datos">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>

