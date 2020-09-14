package Servlet;

import dao.DAOFactory;
import dao.placarddao;
import vo.placard;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 13:18
 * @Version 1.0
 */
/**
 * Servlet implementation class PlacardServlet
 */
@WebServlet("/PlacardServlet")
public class PlacardServlet extends HttpServlet {
    private static final long serialVersionUID =1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlacardServlet() {
        super();
    }

    /**
     *@see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding( "gb2312");
        String ac=request.getParameter("action");
        int action=Integer.parseInt(ac);
        switch (action){
            case 1:
                placard pla=new placard();
                pla.setTitle(request.getParameter("title"));
                pla.setContent (request.getParameter("content"));
                placarddao plad= DAOFactory.instance().getplacarddao();
                plad.insert(pla);
                PrintWriter out1 = response.getWriter();
                out1.println("<script language='javascript'>alert('发布成功!');</script>");
                request.getRequestDispatcher("placardmana/placard_mana.jsp").forward(request, response);
                break;
            case 2:
                int ID=-1;
                placard pla1=new placard();
                ID=Integer.parseInt(request.getParameter("ID"));
                placarddao plad1=DAOFactory.instance().getplacarddao();
                if(ID>0){
                    pla1=plad1.query(ID);
                    request.setAttribute("pla1", pla1);
                }
                    request.getRequestDispatcher("placardmana/placard_detail.jsp").forward(request,response);
                    break;
            case 3:
                String ID1[]=request. getParameterValues("delid");
                String bbsID="";
                PrintWriter out = response. getWriter();
                if(ID1.length>0){
                    for(int i=0;i<ID1. length;i++) {
                        bbsID = bbsID + ID1[i] + ",";
                    }
                    bbsID=bbsID. substring(0,bbsID.length()-1); //去除连接字符串中最后一个字符即逗号
                    int ret=-1;
                    placarddao plad2=DAOFactory.instance().getplacarddao();
                    ret=plad2.delete(bbsID);
                    if(ret==0) {
                        out.println("<script language='javascript'>alert('公告信息删除失败!');</script>");
                        request.getRequestDispatcher("placardmana/placard_mana.jsp").forward(request, response);
                    }else{
                                out.println("<script language='javascript'>alert('公告信息删除成功!');</script>");
                                request.getRequestDispatcher("placardmana/placard_mana.jsp").forward(request,response);
                    }
                }else {
                    out.println("<script language='javascript'>alert('操作有误!');</script>");
                    request.getRequestDispatcher("placardmana/placard_mana.jsp").forward(request,response);
                }
                break;
        }
    }



    /**
     *@see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
