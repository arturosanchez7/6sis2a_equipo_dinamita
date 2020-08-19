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
public class Guardar_Registros extends HttpServlet {

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
             String nom_reg, correo_reg,tel_reg,direc_reg,contra_reg;
            
            nom_reg = request.getParameter("nombre");
            System.out.println(nom_reg);
            correo_reg = request.getParameter("correo");
            System.out.println(correo_reg);
            tel_reg = request.getParameter("telefono");
            System.out.println(tel_reg);
            direc_reg = request.getParameter("direccion");
            System.out.println(direc_reg);
            contra_reg = request.getParameter("contrasena");
            System.out.println(contra_reg);
         Cita a = new Cita();
            
            a.setNombre(nom_reg);
            a.setCorreo(correo_reg);
            a.setTelefono(tel_reg);
            a.setDireccion(direc_reg);
            a.setContraseña(contra_reg);
            
            int estatus = conexion.Guardar_Registros(a);
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Usuario Registrado </title>");            
            out.println("</head>");
            out.println("<body>");
            
            if(estatus > 0){
            
            out.println("<h1>Usuario Resistrado con Exito </h1>");
            
            }else{
            
            out.println("<h1>No se pudo registrar el usuario  </h1>");
            
            }
            out.println("<a href= 'registrocitas.html' >Agendar Cita </a>");
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