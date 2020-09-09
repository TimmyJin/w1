package Servlet;

import dao.DAOFactory;
import dao.userdao;
import vo.consumer;
import vo.operator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 13:18
 * @Version 1.0
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID =1L;
    /**
    * @see HttpServlet#HttpServlet()
    */
    public LoginServlet(){
        super();
    }
    /**
     *@see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("test/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");

        String a=request.getParameter("action");
        int action=Integer.parseInt(a);
        boolean flag = false;
        userdao udao= DAOFactory.instance().getuserdao();
        consumer u = null;
        operator v= null;
        switch (action){
            case 1:
                String name=request.getParameter("name");
                String password=request.getParameter("password");
                String r=request.getParameter("role");
                int role=Integer.parseInt(r);
                boolean b=udao.isLogin(name,password,role);
                if(!b){
                    request.setAttribute("error","用户名或密码错误!");
                    request.getRequestDispatcher("login.jsp").forward(request,response);
                }else {
                    if (role == 1) {
                        u = udao.getId(name, role);
                        HttpSession session = request.getSession();
                        session.setAttribute("consumer", name);
                        request.getRequestDispatcher("consumermana/cons.jsp").forward(request, response);
                    } else{
                        v = udao.getId1(name, role);
                        HttpSession session = request.getSession();
                        session.setAttribute("operator", name);
                        request.getRequestDispatcher("operatormana/oper.jsp").forward(request, response);
                    }
                }
                break;
            case 2:
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
            case 3:
                request.getRequestDispatcher("register.jsp").forward(request, response);
                break;
            case 4:
                String cname=request . getParameter(" cname");
                String pwd=request. getParameter(" password") ;
                String tel=request . getParameter("tel");
                role=1;
                try {
                    u = new consumer();
                    u = udao.getId(cname, role);
                    if (u != null) {
                        request.setAttribute("iderror","此用户名已存在!");
                        try {
                            //转发至注册失败页面.
                            request.getRequestDispatcher("register.jsp").forward(request, response);
                        } catch (Throwable t) {
                            getServletContext().log(t.getMessage());
                        }
                    } else {
                        u = new consumer();
                        u.setCname(cname);
                        u.setCpassword(pwd);
                        u.setCtel(tel);
                        udao.insert(u);
                        request.setAttribute("consumer", u);
                        try {//转发至注册成功页面
                            request.getSession(true).setAttribute("name", cname);
                            request.getRequestDispatcher("index.jsp").forward(request, response);
                        } catch (Throwable t) {
                            getServletContext().log(t.getMessage());
                        }
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }
                break;
        }

    }
    /**
     *@see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
        doGet(request,response);
    }
}