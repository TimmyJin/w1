package dao.imp;

import dao.userdao;
import vo.consumer;
import vo.operator;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 10:09
 * @Version 1.0
 */
public class userdaoimpl implements userdao {

    @Override
    public boolean isLogin(String cname, String password, int role) {
        return false;
    }

    @Override
    public consumer getId(String cname, int role) {
        return null;
    }

    @Override
    public operator getId1(String id, int role) {
        return null;
    }

    @Override
    public boolean insert(consumer u) {
        return false;
    }

    @Override
    public boolean delete(String cname) {
        return false;
    }
}
