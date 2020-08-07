/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sara
 */
public class Editar2 extends HttpServlet {

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
            int id;
            String nom_cli,serv_cli ,email_cli, zona_cli;
            id= Integer.parseInt(request.getParameter("id2"));
            nom_cli=request.getParameter("nombre2");
            serv_cli=request.getParameter("servicio2");
            email_cli=request.getParameter("email2");
            zona_cli=request.getParameter("zona2");
            
            //generar objeto del alumno 
              Cita a = new Cita();
            
            //envio datos del alumno
              a.setId(id);
              a.setNombre(nom_cli);
              a.setServicio(serv_cli);
              a.setEmail(email_cli);
              a.setZona(zona_cli);
              
              //ejecutar la query
              int estatus = conexion.Guardar_Cita(a); 
              
              if(estatus > 0){
                  response.sendRedirect("Consultar_Lista");
              }else{
          
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Editar2</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Error al momento de obtener los datos</h1>"
            +"<a href ='index.html'>Regresar al menú principal</a>");
            out.println("</body>");
            out.println("</html>");
              }
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
