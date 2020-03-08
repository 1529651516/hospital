package dao;

import bean.Apply;
import bean.Doctor;
import util.DBUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ApplyDao {
    /*create table if not exists apply (aid int primary key auto_increment,
                        did int comment '医生id',
                        dname char(16),
                        wid int,
                        reason char(32) comment '原因',
                        applytime datetime  comment '医生这天上午或下午的号源数',
                        request char(8) comment '状态：申请出诊，申请停诊',
                        state char(8) comment '状态：等待处理，同意，拒绝',
                        foreign key(wid) references workday(wid),
                        foreign key(did) references doctor(did));;*/
    public boolean insert(Apply apply){
        Object[] o=new Object[]{apply.getDid(),
                apply.getDname(),
                apply.getWid(),
                apply.getReason(),
                apply.getRequest()};
        String sql="insert into apply values(null,?,?,?,?,now(),?,'等待处理')";
        return DBUtil.executeUpdate(sql,o);
    }
    public ArrayList<HashMap<String, String>> query(String where, Object[] o){
        String sql="select request, workday.worktime,ampm, aid,dname,reason,apply.state,applytime from workday,apply "+where;
       return DBUtil.getHashmap(sql,o);
    }

    public List<Apply> queryBywhere(String where, Object[] o){
        List<Apply> applies=new ArrayList<>();
        String sql="select * from apply "+where;
        ResultSet rs=DBUtil.executeQuery(sql,o);
        try {
            while (rs.next()){
                applies.add(new Apply(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.closeAll();
        }
        return applies;
    }

    public boolean update(String set, Object[] o){
        String sql="update apply "+set;
        return DBUtil.executeUpdate(sql,o);
    }
    public void agree(Object[] o){
        String sql="call agreeApply(?,?)";
        DBUtil.executeUpdate(sql,o);
    }
    public boolean deleteByDid (String docId ){
        String sql="delete from apply where did="+docId;
        return DBUtil.executeDelete(sql);
    }
}
