package dao;
import vo.consumer;
/**
 * @Author TimmyJin
 * @Date 2020/9/7 17:47
 * @Version 1.0
 */

public interface consdao {
    public void update(consumer uu,String cname);
    public int getmoney(String userame);
    public void updatem(String userame,int cmoney);
}
