package vo;

/**
 * @Author TimmyJin
 * @Date 2020/9/7 17:32
 * @Version 1.0
 */
public class consumer {
    private int cid;
    private String cname;
    private String cpassword;
    private String ctel;
    private int cmoney;
    private int ostatus;

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCpassword() {
        return cpassword;
    }

    public void setCpassword(String cpassword) {
        this.cpassword = cpassword;
    }

    public String getCtel() {
        return ctel;
    }

    public void setCtel(String ctel) {
        this.ctel = ctel;
    }

    public int getCmoney() {
        return cmoney;
    }

    public void setCmoney(int cmoney) {
        this.cmoney = cmoney;
    }

    public int getOstatus() {
        return ostatus;
    }

    public void setOstatus(int ostatus) {
        this.ostatus = ostatus;
    }
}
