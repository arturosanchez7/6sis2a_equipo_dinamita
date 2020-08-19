/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrador
 */
public class Consultar_Lista extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
            /* TODO output your page here. You may use following sample code. */
            
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Lista General de Citas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Lista General de Citas</h1>"
                    + "<br>"
                    + "<a href='registrocitas.html'>Regresar al menu principal</a>"
                  );
            
            
            List<Cita> lista = conexion.getAllCita();
            
            out.println("<table border ='1'>");
            out.println("<tr>"
                    + "<th>ID</th>"
                    + "<th>Nombre</th>"
                    + "<th>Servicio</th>"
                    + "<th>Email</th>"
                    + "<th>Zona</th>"
                    + "</tr>");
            
            for(Cita a : lista){
                
                out.println("<tr><"
                        + "<td>"+a.getId()+"</td>"
                        + "<td>"+a.getNombre()+"</td>"
                        + "<td>"+a.getServicio()+"</td>"
                        + "<td>"+a.getEmail()+"</td>"
                        + "<td>"+a.getZona()+"</td>"
                        + "<td><a href= 'Editar_Cita?id="+a.getId()+"' >Editar datos de la cita</a></td>"
                        + "<br>"
                        + "<td><a href= 'Cancelar_Cita?id="+a.getId()+"' >Eliminar la Cita</a></td>"
                        + "/tr>");
                
            }
                
            out.println("</table>");
            
            
            
            
            
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        return "Short description";
    }// </editor-fold>

}
