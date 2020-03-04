package servlet.admin;

import bean.Doctor;
import bean.Pages;
import bean.Recode;
import bean.WorkDay;
import dao.ApplyDao;
import dao.DoctorDao;
import dao.RecodeDao;
import dao.WorkDayDao;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/admin/deleteManage")
public class DeleteManage extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String did = Util.nullToString(req.getParameter("did"));
        String message="";
        RecodeDao recodeDao=new RecodeDao();
        DoctorDao doctorDao = new DoctorDao();
        String where="where did=? and state='成功'and visitdate >? ";
        List<Recode> recodes=recodeDao.query(where,new Object[]{did,new Date()});
        if(recodes!=null&&recodes.size()>0){
            message="删除失败！医生存在成功预约但未出诊的预约";
        }else {
            try{
            boolean b=doctorDao.deleteById(did);
            ApplyDao applyDao=new ApplyDao();
            boolean c=applyDao.deleteByDid(did);
            WorkDayDao workDayDao=new WorkDayDao();
            boolean d =workDayDao.deleteByDid(did);
            message="医生及其关联信息删除成功！";
            }
            catch (Exception e){
                e.printStackTrace();
                message="删除失败";
            }
        }
        req.setAttribute("message",message);
        req.getRequestDispatcher("doctorManage.jsp").forward(req,resp);
    }
}
