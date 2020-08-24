/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Administrador
 */
import java.util.*;
    import java.sql.*;
    

public class conexion {
     public static Connection getConnection(){
        String url, user, password;
        
        url = "jdbc:mysql:3306//localhost/Estetica";
        user = "root";
        password = "1234";
        
        Connection con = null;
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
           url = "jdbc:mysql://localhost/Estetica";
            con =DriverManager.getConnection(url, user, password);
            
            System.out.println("si conecto a la BD");
        
    }catch(Exception e){
        
        System.out.println("no conecto a la BD");
        System.out.println(e.getMessage());
        System.out.println(e.getStackTrace());
        
        
        
    }
     return con;   
    }
    
     public static int Guardar_Cita(Cita a){
        
         int estatus = 0;
         try {
             
             Connection con = conexion.getConnection();
             String q = "insert into Cita (nom_cli, serv_cli,email_cli,zona_cli)"
                     + "values(?,?,?,?)";
             
             
             PreparedStatement ps= con.prepareStatement(q);
             
             ps.setString(1, a.getNombre());
             ps.setString(2, a.getServicio());
             ps.setString(3, a.getEmail());
             ps.setString(4, a.getZona());
          
             
             estatus = ps.executeUpdate();
             
             con.close();
             
             System.out.println("Registro Exitoso");
             
         }catch(Exception e){
            
             System.out.println("No encontro la tabla");
             System.out.println(e.getMessage());
             System.out.println(e.getStackTrace());
         }
         return estatus;
     }
    
      public static int Editar_Cita(Cita a){
        
         int estatus = 0;
         try {
             
             Connection con = conexion.getConnection();
             String q = "update Cita set nom_cli = ?"
                     + "serv_cli = ?"
                     + "email_cli = ?"
                     + "zona_cli = ?"
                     + "where id_cita = ?";
             
             
             PreparedStatement ps= con.prepareStatement(q);
             
             ps.setString(1, a.getNombre());
             ps.setString(2, a.getServicio());
             ps.setString(3, a.getEmail());
             ps.setString(4, a.getZona());
              ps.setInt(5, a.getId());
             estatus = ps.executeUpdate();
             
             con.close();
             
             System.out.println("Edicion Exitosa");
             
         }catch(Exception e){
            
             System.out.println("No encontro la tabla");
             System.out.println(e.getMessage());
             System.out.println(e.getStackTrace());
         }
         return estatus;
     }
      public static int Cancelar_Cita(int id){
        
         int estatus = 0;
         try {
             
             Connection con = conexion.getConnection();
             String q = "delete from Cita where id_cita";
             
             
             PreparedStatement ps= con.prepareStatement(q);
             
             ps.setInt(1, id);
             
             estatus = ps.executeUpdate();
             
             con.close();
             
             System.out.println("Cancelacion Exitosa");
             
         }catch(Exception e){
            
             System.out.println("No encontro la tabla");
             System.out.println(e.getMessage());
             System.out.println(e.getStackTrace());
         }
         return estatus;
     }
    public static Cita getCitaById(int id){
        Cita a= new Cita();
        try{
            
            Connection con = conexion.getConnection();
            
            String q = "select * from cita where id_cita = ?";
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setInt(1, id);
            
           ResultSet rs = ps.executeQuery();
           
           if(rs.next()){
               
              a.setId(rs.getInt(1));
              a.setNombre(rs.getString(2));
              a.setServicio(rs.getString(3));
              a.setEmail(rs.getString(4));
              a.setZona(rs.getString(5));
           }
            
            con.close();
            
            System.out.println("Busqueda Exitosa");
            
        }catch(Exception e){
            
            System.out.println("no encontro la tabla");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        return a;
    }
    
    public static List<Cita> getAllCita(){
        List<Cita> lista = new ArrayList<Cita>();
        
        try{
            
            Connection con = conexion.getConnection();
            
            String q = "select * from cita ";
            PreparedStatement ps = con.prepareStatement(q);
            
            
            
           ResultSet rs = ps.executeQuery();
           
           while(rs.next()){
               
               Cita a = new Cita();
               
              a.setId(rs.getInt(1));
              a.setNombre(rs.getString(2));
              a.setServicio(rs.getString(3));
              a.setEmail(rs.getString(4));
              a.setZona(rs.getString(5));
              lista.add(a);
           }
            
            con.close();
            
            System.out.println("busqueda Exitosa");
            
        }catch(Exception e){
            
            System.out.println("no encontro la tabla");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            
        }
        return lista; 
        
    }
     public static int Guardar_Registros(Cita a){
        
         int estatus = 0;
         try {
             
             Connection con = conexion.getConnection();
             String q = "insert into cliente(nom_reg, correo_reg,tel_reg,dire_reg,contra_reg)"
                     + "values(?,?,?,?,?)";
             
             
             PreparedStatement ps= con.prepareStatement(q);
             
             ps.setString(1, a.getNombre2());
             ps.setString(2, a.getCorreo());
             ps.setString(3, a.getTelefono());
             ps.setString(4, a.getDireccion());
             ps.setString(5, a.getContrasena());
             
             estatus = ps.executeUpdate();
             
             con.close();
             
             System.out.println("Registro Exitoso");
             
         }catch(Exception e){
            
             System.out.println("No encontro la tabla");
             System.out.println(e.getMessage());
             System.out.println(e.getStackTrace());
         }
         return estatus;
     }
    
      
}
