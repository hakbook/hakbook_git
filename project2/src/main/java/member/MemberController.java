package member;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/member2_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		MemberDAO dao=new MemberDAO();
		if(uri.indexOf("list.do") != -1) {
			Map<String,Object> map=new HashMap<>();
			List<MemberDTO> list=dao.memberList();
			map.put("list", list);
			map.put("count", list.size());
			request.setAttribute("map", map);
			String page="/myweb/member_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("view.do") != -1) {
			String userid = request.getParameter("userid");
			MemberDTO dto = dao.memberDetail(userid);
			request.setAttribute("dto", dto);
			String page = "/myweb/member_view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("update.do") != -1) {
			String userid=request.getParameter("userid");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			String zipcode=request.getParameter("zipcode");
			String address1=request.getParameter("address1");
			String address2=request.getParameter("address2");
			MemberDTO dto=new MemberDTO();
			dto.setUserid(userid);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setZipcode(zipcode);
			dto.setAddress1(address1);
			dto.setAddress2(address2);
			dao.update(dto);
			response.sendRedirect(context+"/myweb/main.jsp");
		}else if(uri.indexOf("delete.do") != -1) {
			String userid=request.getParameter("userid");
			dao.delete(userid);
			response.sendRedirect(context+"/myweb/main.jsp");
		}else if(uri.indexOf("join_sha.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			String zipcode=request.getParameter("zipcode");
			String address1=request.getParameter("address1");
			String address2=request.getParameter("address2");
			MemberDTO dto=new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setZipcode(zipcode);
			dto.setAddress1(address1);
			dto.setAddress2(address2);
			dao.insertSha256(dto);
		}else if(uri.indexOf("login_sha.do") != -1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			MemberDTO dto = new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheckSha256(dto);
			String message="";
			String page="";
			if(result=="") {
				message="아이디 또는 비밀번호가 일치하지 않습니다.";
				message=URLEncoder.encode(message, "utf-8");
				page="/myweb/login.jsp?message="+message;
			}else {
				message=result;
				HttpSession session=request.getSession();
				session.setAttribute("userid", userid);
				session.setAttribute("result", result);
				session.setAttribute("message", message);
				page="/myweb/main.jsp";
			}
				response.sendRedirect(request.getContextPath()+page);
			}else if(uri.indexOf("logout.do") != -1) {
				HttpSession session=request.getSession();
				session.invalidate();
				response.sendRedirect(request.getContextPath()+"/myweb/main.jsp");
			}
 	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}
