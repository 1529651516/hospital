package servlet.admin;

import bean.Apply;
import bean.WorkDay;
import dao.ApplyDao;
import dao.WorkDayDao;
import util.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet("/admin/applyManage")
public class ApplyManage extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ApplyDao applyDao=new ApplyDao();
        String action = req.getParameter("action");
        String aid = req.getParameter("aid");
        if("agree".equals(action)){
            int nsnum = Util.nullToZero(req.getParameter("nsnum")) ;
            String setsql=" set state='同意' where aid=?";
            applyDao.update(setsql,new Object[]{aid});
            WorkDayDao workDayDao=new WorkDayDao();
            String applysql="where aid=?";
            List<Apply> applys=applyDao.queryBywhere(applysql,new Object[]{aid});
            String workdaysql=" set nsnum=?,state='预约' where wid=?";
            workDayDao.update(workdaysql,new Object[]{nsnum,applys.get(0).getWid()});
        }else if("reject".equals(action)){
            String set=" set state='拒绝' where aid=?";
            applyDao.update(set,new Object[]{aid});
        }
        ArrayList<HashMap<String, String>> maps = applyDao.query(" where apply.wid=workday.wid  order by applytime desc", null);
        req.setAttribute("maps",maps);
        req.getRequestDispatcher("applyManage.jsp").forward(req,resp);
    }
}
