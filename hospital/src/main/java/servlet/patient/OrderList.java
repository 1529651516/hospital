package servlet.patient;

import bean.Doctor;
import bean.Patient;
import bean.Recode;
import dao.DoctorDao;
import dao.RecodeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/orderList")
public class OrderList extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Patient patient= (Patient) req.getSession().getAttribute("patient");
        RecodeDao recodeDao = new RecodeDao();
        String where="where pid=? order by ordertime desc";
        List<Recode> list = recodeDao.query(where, new Object[]{patient.getId()});
        List<HashMap<String, String>> result = new ArrayList<HashMap<String, String>>();
        for(int i=0;i<list.size();i++){
            HashMap<String,String> info=new HashMap<>();
            info.put("did",list.get(i).getDid());
            info.put("serialnumber",list.get(i).getSerialnumber());
            info.put("visitdate",list.get(i).getVisitdate());
            info.put("visitnoon",list.get(i).getVisitnoon());
            info.put("visittime",list.get(i).getVisittime());
            info.put("ordertime",list.get(i).getOrdertime());
            info.put("state",list.get(i).getState());
            info.put("rid",list.get(i).getRid());
            info.put("wid",list.get(i).getWid());
            DoctorDao doctorDao=new DoctorDao();
            String docSql="where did=?";
            List<Doctor> doctors=doctorDao.query(docSql,new Object[]{list.get(i).getDid()});
            info.put("room",doctors.get(0).getRoom());
            info.put("fee",doctors.get(0).getFee());
            info.put("office",doctors.get(0).getOffice());
            info.put("dname",doctors.get(0).getDname());
            info.put("picpath",doctors.get(0).getPicpath());

            result.add(info);
        }
        req.setAttribute("list",result);
        req.getRequestDispatcher("orderList.jsp").forward(req,resp);
    }
}
