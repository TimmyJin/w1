package dao;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 8:29
 * @Version 1.0
 */
public abstract class DAOFactory {
    private static DAOFactory factory = new JdbcDAOFactory();
    public static DAOFactory instance() {
        return factory;
    }
    public static DAOFactory instance(String factoryName) {
        try {
            Class<?> c = Class.forName(factoryName);
            if(factory.getClass()!=c){
                factory = (DAOFactory)c.newInstance();
            }
            return factory;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    public abstract userdao getuserdao();
    public abstract furdao getfurdao();
    public abstract orderdao getorderdao();
    public abstract consdao getconsdao();
    public abstract placarddao getplacarddao();
}
