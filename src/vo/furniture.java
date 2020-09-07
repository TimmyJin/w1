package vo;

/**
 * @Author TimmyJin
 * @Date 2020/9/7 17:36
 * @Version 1.0
 */
public class furniture {
    private int fid;
    private String fname;
    private String fsummary;
    private int fnum;
    private int money;
    private String fpic;

    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFsummary() {
        return fsummary;
    }

    public void setFsummary(String fsummary) {
        this.fsummary = fsummary;
    }

    public int getFnum() {
        return fnum;
    }

    public void setFnum(int fnum) {
        this.fnum = fnum;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getFpic() {
        return fpic;
    }

    public void setFpic(String fpic) {
        this.fpic = fpic;
    }
}
