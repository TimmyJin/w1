package dao.imp;

import dao.DBUtil;
import dao.placarddao;
import vo.placard;

import java.sql.*;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 10:10
 * @Version 1.0
 */
public class placarddaoimpl implements placarddao {
    @Override
    public void insert(placard plac) {
        String sql="insert into placard(title,content) values ('"+plac.getTitle()+"','"+plac.getContent()+"')";
        Connection conn=null ;
        try{
            conn=DBUtil.getConnection();
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(null, null, conn);
        }
    }

    @Override
    public placard query(int ID) {
        String sql="select * from placard where ID='"+ID+"'";
        Connection conn=null;
        ResultSet rs=null;
        placard pla=null;
        try{
            conn=DBUtil.getConnection();
            rs=conn.createStatement().executeQuery(sql);
            if(rs.next()){
                pla=new placard();
                pla.setID(rs.getInt(1));
                pla.setTitle(rs.getString(2));
                pla.setContent(rs.getString(3));
                return pla;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            DBUtil.close(rs,null,conn);
        }
        return null ;

    }

    @Override
    public int delete(String bbsID) {
        int result=0;
        String sq1="delete from placard where ID in("+bbsID+")";
        Connection conn=null;
        ResultSet rs=null;
        try{
            conn=DBUtil.getConnection();
            PreparedStatement ps=conn.prepareStatement(sq1);
            result=ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            DBUtil.close(null,null,conn);
        }
        return result;
    }
}
