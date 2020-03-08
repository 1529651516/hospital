package servlet.admin;

import bean.Office;
import bean.Pages;
import dao.OfficeDao;
import org.json.JSONArray;
import org.json.JSONObject;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/officeList")
public class OfficeManageList extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = Util.nullToString(req.getParameter("action"));
        String message="";
        OfficeDao officeDao=new OfficeDao();
        List<Office> offices;
                offices = officeDao.query("officename", "","");
                JSONArray array=new JSONArray();
                for(Office office:offices){
                    JSONObject jsonObject=new JSONObject();
                    jsonObject.put("officename",office.getOfficename());
                    jsonObject.put("description",office.getDescription());
                    jsonObject.put("doctornum",office.getDoctornum());
                    array.put(jsonObject);
                }
                resp.setContentType("application/json; charset=utf-8");
                resp.getWriter().write(array.toString());
        req.getRequestDispatcher("office.jsp").forward(req,resp);
    }
}
