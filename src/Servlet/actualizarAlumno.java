package Servlet;

import Controlador.AccionesAlumno;
import Modelo.Alumno;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author demon
 */
public class actualizarAlumno extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Obtener parámetros de la solicitud
            int id = Integer.parseInt(request.getParameter("id2"));
            int edad = Integer.parseInt(request.getParameter("edad2"));
            String nombre = request.getParameter("nombre2");
            String apellidoPaterno = request.getParameter("apellidoPaterno2");
            String apellidoMaterno = request.getParameter("apellidoMaterno2");
            String correo = request.getParameter("correo2");

            // Crear instancia de Alumno
            Alumno alu = new Alumno();
            alu.setIdalumno(id);
            alu.setNombre(nombre);
            alu.setApellidoPaterno(apellidoPaterno);
            alu.setApellidoMaterno(apellidoMaterno);
            alu.setEdad(edad);
            alu.setCorreo(correo);

            // Ejecutar la actualización
            int estatus = AccionesAlumno.editarAlumno(alu);

            if (estatus > 0) {
                // Redirigir a inicio.jsp si la actualización es exitosa
                response.sendRedirect("inicio.jsp");
            } else {
                // Redirigir a error.jsp si la actualización falla
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            // Manejo de errores de formato de número
            response.sendRedirect("error.jsp");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Actualiza la información del alumno";
    }
}
