package Servlet;


import dao.*;
import vo.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 13:17
 * @Version 1.0
 */
@WebServlet("/ConsServlet")
public class ConsServlet extends HttpServlet {
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConsServlet(){
        super();
        // TODO Auto- generated constructor stub
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
        String ac=request.getParameter("action");
        int action = Integer.parseInt(ac);
        switch (action){
            case 1:
                request.getRequestDispatcher("consumermana/changecons.jsp").forward(request,response);
                break;
            case 2:
                String id=request.getParameter("id");
                String cname=request.getParameter(" cname") ;
                String cpassword=request.getParameter("password" );
                String ctel=request.getParameter("ctel");
                userdao udao=DAOFactory.instance().getuserdao();
                consumer uu=new consumer();
                uu=udao.getId(cname, 1);
                if(uu!=null){
                    request. setAttribute("iderror","Username is exists!");
                    try{
                        //转发至注册失败页面
                        request. getRequestDispatcher("consumermana/changecons.jsp").forward(request,response);
                    }catch(Throwable t){
                        getServletContext().log(t. getMessage());
                    }
                }else {
                    uu.setCname(cname);
                    uu.setCpassword(cpassword);
                    uu.setCtel(ctel);
                    consdao cdao = DAOFactory.instance().getconsdao();
                    cdao.update(uu, id);
                    PrintWriter out = response.getWriter();
                    out.println("<script language='javascript'>alert('信息修改成功');window.location.href='index.jsp';</script>");
                }
                break;
            case 3:
                session.invalidate();//取消所有的回话
                request.getRequestDispatcher("homepage.jsp").forward(request,response);
                break;
            case 4:
                request.getRequestDispatcher("cart/cart-see.jsp").forward(request,response);
                break;
            case 5:
                request.getRequestDispatcher("ordermana/order_user.jsp").forward(request, response);
                break;
        }
    /**
     *@see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    }
    protected void doPost (HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        // TODO Auto- generated methed stub
        doGet(request,response);
    }
}
