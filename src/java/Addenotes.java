
import DAO.Dao;
import Model.Enotes;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@MultipartConfig(maxFileSize = 16177216)

public class Addenotes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Addenotes</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Addenotes at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            Dao d = new Dao();
            Enotes e = new Enotes();
            e.setEnotesid(d.getNextEnotesID());
            e.setUserid(Integer.parseInt(request.getParameter("UserID")));
            e.setLogo(request.getPart("Logo"));
            e.setName(request.getParameter("Name"));
            e.setDescription(request.getParameter("Description"));
            e.setDocument(request.getPart("Document"));

            if (d.addEnotes(e)) {
                out.print("<script>\n"
                        + "                    alert(\"ENotes Added !\");\n"
                        + "                    window.location.href=\"InstitutionDashboard.jsp\";\n"
                        + "            </script>");
            }
        } catch (SQLException ex) {
            out.print(ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
