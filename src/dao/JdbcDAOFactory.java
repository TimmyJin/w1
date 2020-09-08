package dao;
import dao.imp.*;
/**
 * @Author TimmyJin
 * @Date 2020/9/8 8:32
 * @Version 1.0
 */
public class JdbcDAOFactory extends DAOFactory{
    @Override
    public userdao getuserdao() {
        return new userdaoimpl();
    }

    @Override
    public furdao getfurdao() {
        return new furdaoimpl();
    }

    @Override
    public orderdao getorderdao() {
        return new orderdaoimpl();
    }

    @Override
    public consdao getconsdao() {
        return new consdaoimpl();
    }

    @Override
    public placarddao getplacarddao() {
        return new placarddaoimpl();
    }
}
