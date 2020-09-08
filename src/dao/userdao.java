package dao;

import vo.consumer;
import vo.operator;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 8:34
 * @Version 1.0
 */
public interface userdao {
    public boolean isLogin(String cname,String password,int role);
    public consumer getId(String cname,int role);
    public operator getId1(String id,int role);
    public boolean insert(consumer u);
    public boolean delete(String cname);
}
