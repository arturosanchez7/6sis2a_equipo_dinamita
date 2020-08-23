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
public class Editar_Cita extends HttpServlet {

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
            
            int id;
            
            id = Integer.parseInt(request.getParameter("id"));
            
           Cita a = conexion.getCitaById(id);
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Ficha de los del alumno</title>");            
            out.println("</head>");
            out.println("<style>");
            out.println("<body{>");
            out.println("<background: url(mujer.jpg)>");
            out.println("</style>");
            out.println("<body>");
            out.println("<h1>Ficha de datos del alumno para editar </h1>");
            out.println("<form mehotd='get' name'formulario' action='Editar2'>");
            out.println("<table border='1'>");
            out.println("<tr>"
                    + "<td></td>"
                    + "<td><input type='hidden'  name='id2' value='"+a.getId()+"'</td>"
                    + "</tr>"
                    + "<tr>"
                    + "<td>Nombre:</td>"
                    + "<td><input type='text'  name='nombre2' value='"+a.getNombre()+"'</td>"
                    + "</tr>"
                    + "<tr>"
                    + "<td>Servicio:</td>"
                    + "<td><input type='password'  name='servicio2' value='"+a.getServicio()+"'</td>"
                    + "</tr>"
                    + "<tr>"
                    + "<td>Email:</td>"
                    + "<td><input type='email'  name='email2' value='"+a.getEmail()+"'</td>"
                    + "</tr>"
                    + "<tr><td>Zona: </td><td><select name='zona2' >"
                    + "<option>Insurgentes</option>"
                    + "<option>Polanco</option>"
                    + "<option>Cuauhtemoc</option>"
                    + "<option>Zona Rosa</option>"
                    + "</select></td></tr>"
                    + "<tr><td colspan='2'><input type='submit' value ='Editar Datos'></td></tr>");
            out.println("</table>");
            out.println("</form>");
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
