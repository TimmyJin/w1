package Servlet;

import dao.DAOFactory;
import dao.consdao;
import dao.furdao;
import dao.orderdao;
import vo.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Vector;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 13:18
 * @Version 1.0
 */
/**
 * Servlet implementation class OrdServlet
 */
@WebServlet("/OrdServlet")
public class OrdServlet extends HttpServlet{
    private static final long serialVersionUID =1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdServlet() {
        super();
    }

    /**
     *@see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType ("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
        String ac=request.getParameter("action");
        int action=Integer.parseInt(ac);
        switch (action){
            case 1:
                String username=request. getParameter("username123");
                String Truename=request. getParameter("Truename");
                String address=request. getParameter("address");
                String bz=request . getParameter("bz");
                int orderID=0;
                int number=0;
                int price1=0;
                int sum=0;
                int Totalsum=0;
                String flag="True";
                int temp=0, temp1=0;
                int ID2=-1;
                HttpSession session = request. getSession();
                Vector ct1=(Vector)request. getSession(). getAttribute("ct");
                for(int i=0;i<ct1.size();i++)
                {
                    cart cc=(cart)ct1. elementAt(i);
                    price1=cc.getPrice();
                    number=cc.getNum();
                    sum=number*price1;
                    Totalsum+=sum;
                }
                consumer cons=new consumer();
                consdao cdao=DAOFactory. instance( ).getconsdao();
                int cmoney=0;
                PrintWriter out = response. getWriter();
                cmoney=cdao. getmoney(username);
                if(cmoney<Totalsum)
                {
                    flag="false";
                }else{
                    cmoney=cmoney-Totalsum;
                    cdao. updatem(username, cmoney);
                }
                if(flag. equals("false")) {
                    out = response.getWriter();
                    out.println("<script language='javascript'>alert('订单无效');history.back();</script>");
                }else {
                    int bnumber=ct1. size();
                    order ord=new order();
                    ord.setBnumber( bnumber );
                    ord.setUsername (username);
                    ord.setTruename (Truename);
                    ord.setAddress(address);
                    ord.setBz(bz);
                    orderdao odao=DAOFactory.instance().getorderdao();
                    odao. insert(ord) ;
                    orderdao odao1=DAOFactory.instance().getorderdao();
                    furdao fdao=DAOFactory.instance().getfurdao();
                    temp=odao1.getId(ord);
                    if(temp==0){
                        flag="false";
                    }else{
                        orderID=temp;
                    }
                    order_detail ord1=new order_detail();
                    String str="";
                    for(int i=0;i<ct1.size();i++)
                    {
                        cart cc=( cart)ct1. elementAt(i);
                        ID2=cc. getID();
                        price1=cc.getPrice();
                        number=cc.getNum( );
                        sum=number*price1;
                        ord1.setOrderID(orderID) ;
                        ord1.setGoodsID(ID2);
                        ord1.setPrice(price1);
                        ord1.setNumber( number);
                        temp=odao.insert1(ord1);
                        temp1=fdao.update(ID2, number);
                        Totalsum+=sum;
                        if(temp==0|temp==0)
                        {
                            flag="false";
                        }
                    }
                    if(flag.equals("false")){
                        out = response.getWriter();
                        out.println("<script language='javascript'>alert('订单无效');history.back();</script>");
                    }else {
                        session.removeAttribute("ct");
                        out = response.getWriter();
                        //out. printIn("订单生成");
                        out.println("<script language='javascript'>alert('订单生成');window.location.href='index.jsp'</script>");
                        //request. getRequestDispatcher(" index . jsp"). forward(request, response);
                    }
                }
                break;
                case 2:
                String sdate=request . getParameter("sdate");
                String edate=request. getParameter("edate");
                count ct=new count( );
                int currentPage = 1;
                try{
                    currentPage=Integer . parseInt(request . getParameter("page"));
                }catch(NumberFormatException e){
                    currentPage = 1;
                }
                request. setAttribute("currentPage", currentPage);
                int pageMaxNum = 10;
                request. setAttribute("pageMaxNum", pageMaxNum);
                orderdao oodao= DAOFactory.instance() . getorderdao();
                int count1=oodao.getCount(ct, sdate,edate);
                int totalPage = (count1%pageMaxNum==0)? count1/pageMaxNum: (count1/pageMaxNum+1);
                request.setAttribute("totalPage",totalPage);
                List<count> clist=oodao. getByCondition(ct,(currentPage-1)*pageMaxNum,pageMaxNum,sdate,edate);
                request.setAttribute("clist",clist);
                int ssum=oodao. getSum(sdate, edate);
                request.setAttribute("ssum",ssum);
                request.getRequestDispatcher("furmana/furallinfo.jsp").forward(request,response);
                break;
        }
    }
    /**
     *@see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
