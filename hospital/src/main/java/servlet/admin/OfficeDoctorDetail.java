package servlet.admin;

import bean.Doctor;
import bean.Office;
import bean.Room;
import dao.DoctorDao;
import dao.OfficeDao;
import dao.RoomDao;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/officeDoctorDetail")
public class OfficeDoctorDetail extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String office = Util.nullToString(req.getParameter("office"));

        OfficeDao officeDao=new OfficeDao();
        List<Office> list = officeDao.query("officename", office, "");
        DoctorDao doctorDao=new DoctorDao();
        String doctorSql="where office=?";
        List<Doctor> doctors=doctorDao.query(doctorSql,new Object[]{office});
        req.setAttribute("office",list.get(0));
        req.setAttribute("list1",doctors);
        req.getRequestDispatcher("officeDoctorDetail.jsp").forward(req,resp);
    }
}
