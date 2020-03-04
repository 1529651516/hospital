package servlet;

import bean.Admin;
import bean.Doctor;
import bean.Patient;
import com.mysql.cj.util.StringUtils;
import dao.DoctorDao;
import dao.PatientDao;
import dao.impl.IAdminimpl;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/modifyBaseInfo")
public class ModifyBaseInfo extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = Util.nullToString(req.getParameter("action"));
        String email = Util.nullToString(req.getParameter("email"));
        String name = Util.nullToString(req.getParameter("name"));
        String idcard = Util.nullToString(req.getParameter("idcard"));
        String phone = Util.nullToString(req.getParameter("phone"));
        String message="";
        String  set="set email=?,name=?,idcard=?,phone=? where pid=?";
        switch (action){
            case "doctor":
                Doctor doctor = (Doctor) req.getSession().getAttribute("doctor");
                DoctorDao doctorDao=new DoctorDao();
                if(doctorDao.update(set,new Object[]{email,name,idcard,phone,doctor.getDid()})){
                    message="修改成功";
                }else {
                    message="修改失败";
                }
                req.setAttribute("message",message);
                req.getRequestDispatcher("doctor/modifyPwd.jsp").forward(req,resp);
                break;
            case "patient":
                Patient patient= (Patient) req.getSession().getAttribute("patient");
                PatientDao patientDao=new PatientDao();
                if(patientDao.update(set,new Object[]{email,name,idcard,phone,patient.getId()})){
                    message="修改成功";
                }else {
                    message="修改失败";
                }
                req.setAttribute("message",message);
                req.setAttribute("email",email);
                req.setAttribute("name",name);
                req.setAttribute("idcard",idcard);
                req.setAttribute("phone",phone);
                req.getRequestDispatcher("modifyBaseInfo.jsp").forward(req,resp);
                break;
            case "admin":
                Admin admin= (Admin) req.getSession().getAttribute("admin");
                IAdminimpl adminDao=new IAdminimpl() ;
                if(adminDao.updateAdmin(set,new Object[]{email,name,idcard,phone,admin.getAccount()})){
                    message="修改成功";
                }else {
                    message="修改失败";
                }

                req.setAttribute("message",message);
                req.setAttribute("email",email);
                req.getRequestDispatcher("admin/modifyPwd.jsp").forward(req,resp);
                break;
        }
    }
}
