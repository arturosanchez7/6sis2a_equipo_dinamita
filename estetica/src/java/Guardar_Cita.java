import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrador
 */
public class Guardar_Cita extends HttpServlet {

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
             String nom_cli, serv_cli, email_cli, zona_cli;
            
            nom_cli = request.getParameter("nombre");
            serv_cli = request.getParameter("servicio");
            email_cli = request.getParameter("email");
            zona_cli = request.getParameter("zona");
            
         Cita a = new Cita();
            
            a.setNombre(nom_cli);
            a.setServicio(serv_cli);
            a.setEmail(email_cli);
            a.setZona(zona_cli);
            
            int estatus = conexion.Guardar_Cita(a);
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Cita Registrada </title>");            
            out.println("</head>");
            out.println("<body>");
            
            if(estatus > 0){
            
            out.println("<h1>Cita Registrado con exito </h1>");
            
            }else{
            
            out.println("<h1>No se pudo registrar la cita </h1>");
            
            }
            out.println("<a href= 'index.html' >Regresar al menu principal </a>");
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