package Servlet;

import dao.DAOFactory;
import dao.furdao;
import vo.cart;
import vo.furniture;

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
@WebServlet("/FurServlet")
public class FurServlet extends HttpServlet{
    private static final long serialVersionUID =1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FurServlet() {
        super();
        // TODO Auto- generated constructor stub
    }

    /**
      *@see HttpServlet#doGet(HttpServletRequest request,HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
        String ac = request.getParameter("action");
        HttpSession session = request.getSession();
        int action = Integer.parseInt(ac);
        switch (action) {
            case 1:
                String fidf = request.getParameter("ID");
                int fid = Integer.parseInt(fidf);
                furdao fdao = DAOFactory.instance().getfurdao();
                furniture furchange = fdao.getId(fid);
                request.setAttribute("furchange", furchange);
                request.getRequestDispatcher("furmana/ furchange. jsp").forward(request, response);
                break;
            case 2:
                String fids = request.getParameter("fid");
                int fida = Integer.parseInt(fids);
                String fname = request.getParameter("fname");
                String fsummary = request.getParameter("fsummary");
                String fnumf = request.getParameter("fnum");
                int fnum = Integer.parseInt(fnumf);
                String fmoneyf = request.getParameter("fmoney");
                int fmoney = Integer.parseInt(fmoneyf);
                furniture f = new furniture();
                f.setFid(fida);
                f.setFname(fname);
                f.setFsummary(fsummary);
                f.setFnum(fnum);
                f.setFmoney(fmoney);
                fdao = DAOFactory.instance().getfurdao();
                fdao.update(f);
                PrintWriter out = response.getWriter();
                out.println("修改成功");
                break;
            case 3:
                fids = request.getParameter("id");
                fdao = DAOFactory.instance().getfurdao();
                out = response.getWriter();
                if (fdao.delete(fids)) {
                    out.print("<script language='javascript'>alert('删除成功！');</script>");
                    request.getRequestDispatcher("furmana/furmana.jsp").forward(request, response);
                } else {
                    out.print("<script language='javascript'>alert('删除失败！');</script>");
                    request.getRequestDispatcher("furmana/furmana.jsp").forward(request, response);
                }
                break;
            case 4:
                fname = request.getParameter("fname");
                fsummary = request.getParameter("fsummary");
                String fmoney1 = request.getParameter("fmoney");
                fmoney = Integer.parseInt(fmoney1);
                String fpic = request.getParameter("fpic");
                fpic = "./images/" + fpic + ".jpg";
                furniture fur = new furniture();
                fur.setFname(fname);
                fur.setFsummary(fsummary);
                fur.setFmoney(fmoney);
                fur.setFpic(fpic);
                fdao = DAOFactory.instance().getfurdao();
                out = response.getWriter();
                if (fdao.insert(fur))
                    out.print("<script language='javascript'>alert('添加成功!');" + "window.location.href='furmana/furmana.jsp';</script>");
                else
                    out.print("<script language='javascript'>alert('添加失败!');" + "window.location.href='furmana/furmana.jsp';</script>");
                break;
            case 5:
                fname = request.getParameter("fname");
                request.setAttribute("fname", fname);
                furniture fu = new furniture();
                fu.setFname(fname);
                int currentPage = 1;
                try {
                    currentPage = Integer.parseInt(request.getParameter("page"));
                } catch (NumberFormatException e) {
                    currentPage = 1;
                }
                request.setAttribute("currentPage", currentPage);
                int pageMaxNum = 5;
                request.setAttribute("pageMaxNum", pageMaxNum);
                furdao fudao = DAOFactory.instance().getfurdao();
                int count = fudao.getCount(fu);
                int totalPage = (count % pageMaxNum == 0) ? count / pageMaxNum : (count / pageMaxNum + 1);
                request.setAttribute("totalPage", totalPage);
                List<furniture> flist = fudao.getByCondition(fu, (currentPage - 1) * pageMaxNum, pageMaxNum);
                request.setAttribute("flist", flist);
                request.getRequestDispatcher("main.jsp").forward(request, response);
                break;
            case 6:
                String username = "";
                username = (String) session.getAttribute(" consumer");
                if (username == "" || username == null) {
                    out = response.getWriter();
                    out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
                } else {
                    String ID1 = request.getParameter("id");
                    int ID = Integer.parseInt(ID1);
                    fudao = DAOFactory.instance().getfurdao();
                    furniture fur1 = new furniture();
                    fur1 = fudao.getId(ID);
                    int price = fur1.getFmoney();
                    int num = 1;
                    cart ca = new cart();
                    ca.setID(ID);
                    ca.setPrice(price);
                    ca.setNum(num);
                    boolean Flag = true;
                    //HttpSession session = request. getSession( );
                    Vector ct = (Vector) session.getAttribute("ct");
                    if (ct == null) {
                        ct = new Vector();
                    } else {
                        for (int j = 0, i = 0; i < ct.size(); i++) {
                            cart cb = (cart) ct.elementAt(i);
                            if (cb.getID() == ca.getID()) {
                                j = cb.getNum();
                                j++;
                                cb.setNum(j);
                                ct.setElementAt(cb, i);
                                Flag = false;
                            }
                        }
                    }
                    if (Flag) ct.addElement(ca);
                    session.setAttribute("ct", ct);

                    response.sendRedirect("cart/cart-see.jsp");
                }
                break;
        }
    }
    /**
     *@see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
        doGet(request,response);
    }
}