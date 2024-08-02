package Controlador;

import java.sql.*;
import Modelo.Alumno;
import java.util.*;

public class AccionesAlumno {

    // Método para registrar un nuevo alumno
    public static int registrarAlumno(Alumno alu){
        int estatus = 0;

        try {
            Connection con = Conexion.getConection();
            String q = "INSERT INTO alumnos(nom_usu, appat_usu, apmat_usu, edad_usu, email_usu) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, alu.getNombre());
            ps.setString(2, alu.getApellidoPaterno());
            ps.setString(3, alu.getApellidoMaterno()); // Asegúrate de que el método exista en `Alumno`
            ps.setInt(4, alu.getEdad());
            ps.setString(5, alu.getCorreo());
            estatus = ps.executeUpdate();
            System.out.println("Alumno registrado exitosamente");
            con.close();
        } catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
            System.out.println("No se pudo registrar el alumno");
        }
        return estatus;
    }

    // Método para obtener todos los alumnos
    public static List<Alumno> getAllAlumnos(){
        List<Alumno> listaalumnos = new ArrayList<>();

        try {
            Connection con = Conexion.getConection();
            String q = "SELECT * FROM registroalumnos3";
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet rs = ps.executeQuery();

            while(rs.next()) {
                Alumno alu = new Alumno();
                alu.setIdalumno(rs.getInt("id_usu"));
                alu.setNombre(rs.getString("nom_usu"));
                alu.setApellidoPaterno(rs.getString("appat_usu"));
                alu.setApellidoMaterno(rs.getString("apmat_usu")); // Asegúrate de que el método exista en `Alumno`
                alu.setEdad(rs.getInt("edad_usu"));
                alu.setCorreo(rs.getString("email_usu"));
                listaalumnos.add(alu);
            }
            System.out.println("Se obtuvieron los alumnos");
            con.close();
        } catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
            System.out.println("No se pudo obtener la lista");
        }
        return listaalumnos;
    }

    // Método para buscar un alumno por ID
    public static Alumno buscarAlumnoById(int id){
        Alumno alu = new Alumno();
        try {
            Connection con = Conexion.getConection();
            String q = "SELECT * FROM registroalumnos3 WHERE id_usu = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                alu.setIdalumno(rs.getInt("id_usu"));
                alu.setNombre(rs.getString("nom_usu"));
                alu.setApellidoPaterno(rs.getString("appat_usu"));
                alu.setApellidoMaterno(rs.getString("apmat_usu")); // Asegúrate de que el método exista en `Alumno`
                alu.setEdad(rs.getInt("edad_usu"));
                alu.setCorreo(rs.getString("email_usu"));
            }
            con.close();
        } catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
            System.out.println("No se pudo encontrar el alumno");
        }
        return alu;
    }

    // Método para editar un alumno existente
    public static int editarAlumno(Alumno alu){
        int estatus = 0;

        try {
            Connection con = Conexion.getConection();
            String q = "UPDATE alumnos SET nom_usu = ?, appat_usu = ?, apmat_usu = ?, edad_usu = ?, email_usu = ? WHERE id_usu = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, alu.getNombre());
            ps.setString(2, alu.getApellidoPaterno());
            ps.setString(3, alu.getApellidoMaterno()); // Asegúrate de que el método exista en `Alumno`
            ps.setInt(4, alu.getEdad());
            ps.setString(5, alu.getCorreo());
            ps.setInt(6, alu.getIdalumno());
            estatus = ps.executeUpdate();
            System.out.println("Alumno editado exitosamente");
            con.close();
        } catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
            System.out.println("No se pudo actualizar el alumno");
        }
        return estatus;
    }

    // Método para eliminar un alumno
    public static int eliminarAlumno(int id){
        int estatus = 0;

        try {
            Connection con = Conexion.getConection();
            String q = "DELETE FROM registroalumnos3 WHERE id_usu = ?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, id);
            estatus = ps.executeUpdate();
            System.out.println("Alumno eliminado exitosamente");
            con.close();
        } catch(Exception e) {
            System.out.println("Error: " + e.getMessage());
            System.out.println("No se pudo eliminar el alumno");
        }
        return estatus;
    }
}
