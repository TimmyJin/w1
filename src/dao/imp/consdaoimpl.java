package dao.imp;

import dao.DBUtil;
import dao.consdao;
import vo.consumer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 10:09
 * @Version 1.0
 */
public class consdaoimpl implements consdao {
    @Override
    public void update(consumer uu, String cname) {
        Connection conn= DBUtil.getConnection();
        String sql="update consumer set cname=?,cpassword=?,ctel=? where cname='"+cname+"'";
        PreparedStatement pst=null;
        try {
            pst=conn.prepareStatement(sql);
            pst.setString(1,uu.getCname());
            pst.setString(2,uu.getCpassword());
            pst.setString(3,uu.getCtel());
            pst.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(null,null,conn);
        }
    }

    @Override
    public int getmoney(String userame) {
        String sql="select cmoney from consumer where cname='"+userame+"'";
        Connection conn=null;
        ResultSet rs=null;
        int result=0;
        try {
            conn=DBUtil.getConnection();
            rs=conn.createStatement().executeQuery(sql);
            if(rs.next()){
                result = rs.getInt("cmoney");
                return result;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs,null,conn);
        }
        return result;
    }

    @Override
    public void updatem(String userame, int cmoney) {
        String sql = "update consumer set cmoney='"+cmoney+"' where cname='"+userame+"'";
        Connection conn = DBUtil.getConnection();
        PreparedStatement pst=null;
        try{
            pst = conn.prepareStatement(sql);
            pst.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(null,null,conn);
        }
    }
}
