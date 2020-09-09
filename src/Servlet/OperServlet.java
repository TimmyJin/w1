package Servlet;

import dao.DAOFactory;
import dao.userdao;
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
 * @Date 2020/9/8 13:18
 * @Version 1.0
 */
/**
 * Servlet implementation class operServlet
 */
@WebServlet("/OperServlet")
public class OperServlet extends HttpServlet {
    private static final long serialVersionUID =1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OperServlet() {
        super();
    }

    /**
     *@see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
        String ac = request.getParameter("action");
        int action = Integer.parseInt(ac);
        switch (action) {
            case 1:
                request.getRequestDispatcher("furmana/furmana.jsp").forward(request, response);
                break;
            case 2:
                break;
            case 3:
                request.getRequestDispatcher("ordermana/ordermanage.jsp").forward(request, response);
                break;
            case 4:
                session.invalidate();
                request.getRequestDispatcher("homepage.jsp").forward(request, response);
                break;
            case 5:
                request.getRequestDispatcher("placardmana/placard_mana.jsp").forward(request, response);
                break;
            case 6:
                String cname = request.getParameter(" cname");
                userdao udao = DAOFactory.instance().getuserdao();
                PrintWriter out = response.getWriter();
                if (udao.delete(cname)) out.print("<script language='javascript'>alert('删除成功!');"
                        + "window.location.href='operatormana/membermana.jsp';</script>");
                else out.print("<script language='javascript'>alert(删除失败!');"
                        + "Window.location.href='operatormana/membermana.jsp';</script>");
                break;
            case 7:
                String d = "fname";
                request.setAttribute("k", d);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case 8:
                d = "fsummary";
                request.setAttribute("k", d);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case 9:
                d = "fnum";
                request.setAttribute("k", d);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case 10:
                d = "fmoney";
                request.setAttribute("k", d);
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case 11:
                d = "";
                request.setAttribute("k", d);
                request.getRequestDispatcher("index.jsp").forward(request, response);
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
