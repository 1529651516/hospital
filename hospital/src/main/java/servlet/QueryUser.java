package servlet;

import bean.Admin;
import bean.Doctor;
import bean.Patient;
import dao.DoctorDao;
import dao.PatientDao;
import dao.impl.IAdminimpl;
import util.Util;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

@WebServlet("/QueryUser")
public class QueryUser extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Doctor dc = (Doctor) req.getSession().getAttribute("doctor");
        Patient pt = (Patient) req.getSession().getAttribute("patient");
        Admin ad = (Admin) req.getSession().getAttribute("admin");
        String action="";
        if(dc!=null){
            action="doctor";
        }else if(pt!=null){
            action="patient";
        }else if(ad!=null){
            action="admin";
        }
        String email = "";
        String name = "";
        String idcard = "";
        String phone ="" ;
        switch (action){
            case "doctor":
                Doctor doctor = (Doctor) req.getSession().getAttribute("doctor");
                DoctorDao doctorDao=new DoctorDao();
                doctorDao.query( "where account=? ",new Object[]{doctor.getDid()});
               // req.setAttribute("",message);
                req.getRequestDispatcher("doctor/modifyPwd.jsp").forward(req,resp);
                break;
            case "patient":
                PatientDao patientDao=new PatientDao();
                List<Patient> patients=patientDao.query( " pid ",pt.getId());
                if(patients.size()>0){
                    req.setAttribute("email",patients.get(0).getEmail());
                    req.setAttribute("name",patients.get(0).getName());
                    req.setAttribute("idcard",patients.get(0).getIdcard());
                    req.setAttribute("phone",patients.get(0).getPhone());
                    req.getRequestDispatcher("modifyBaseInfo.jsp").forward(req,resp);
                }
                break;
            case "admin":
                Admin admin= (Admin) req.getSession().getAttribute("admin");
                IAdminimpl adminDao=new IAdminimpl() ;
                adminDao.getAdmin(admin.getAccount());

                req.getRequestDispatcher("admin/modifyPwd.jsp").forward(req,resp);
                break;
        }
    }
}
