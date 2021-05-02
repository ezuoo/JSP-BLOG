package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.Member;
import repository.MemberDAOImpl;

@WebServlet({"/Member","/member-login.do","/member-logout.do", "/member-create.do", "/member-read.do","/member-edit.do", 
	"/member-delete.do", "/member-list-view.do"})
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberController() {
        super();
    }
    
    MemberDAOImpl repository = null;
    Member member = null;
    List<Member> memberList = new ArrayList<Member>();

    protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8"); 
		//Member searched = null;
		repository = new MemberDAOImpl();
		
		member = new Member();
    	member.setName((String) request.getParameter("name"));
    	member.setEmail((String) request.getParameter("email"));
    	member.setPw((String) request.getParameter("pw"));
    	member.setPhone((String) request.getParameter("phone"));
    	member.setAddress((String) request.getParameter("address"));
    	member.setRegdate((String) request.getParameter("regdate"));
    
    	
    	// login
		if(action.equals("member-login.do")) {
			if(repository.login(member) == 1) {
				session.setAttribute("email", member.getEmail());
				request.setAttribute("exceptionMsg", "login success");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else {
				request.setAttribute("exceptionMsg", "로그인 실패 - 다시 로그인해주시기 바랍니다.");
	    		request.getRequestDispatcher("member-exception-view.jsp").forward(request, response);
			}
		}
		
		else if(action.equals("member-list-view.do")) {
			memberList = repository.readList();
			request.setAttribute("memberlist", memberList);
			request.getRequestDispatcher("member-list-view.jsp").forward(request, response);
			/*
			if((blogList = repository.readList()) != null) {
				request.setAttribute("bloglist", blogList);
				request.getRequestDispatcher("blog-list-view.jsp").forward(request, response);
			} else {
				request.setAttribute("exceptionMsg", "블로그 목록 가져오기 오류 - 불편을 드려 죄송합니다.");
				request.getRequestDispatcher("blog-exception-view.jsp").forward(request, response);
			}*/
		}
		
		// logout
		else if(action.equals("member-logout.do")) {
			session.removeAttribute("email");
			request.setAttribute("exceptionMsg", "logout success");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		// sign up
		else if(action.equals("member-create.do")){
			if(repository.login(member) == 0 && repository.create(member) > 0) {
	    		request.getRequestDispatcher("member-login.jsp").forward(request, response);
	    	} else {
	    		request.setAttribute("exceptionMsg", "회원 등록 오류 - 다시 회원 등록해주시기 바랍니다.");
	    		request.getRequestDispatcher("member-exception-view.jsp").forward(request, response);
	    	}
			
		}
		
		// my page
		else if(action.equals("member-read.do")) {
			member.setEmail((String) session.getAttribute("email"));
			
			Member retMember = repository.read(member);
		
			if(retMember != null) {
				request.setAttribute("member", retMember);
				request.getRequestDispatcher("member-read.jsp").forward(request, response);
			} 
			else {
				request.setAttribute("exceptionMsg", "회원 정보 불러오기 오류 - 불편을 드려 죄송합니다.");
				request.getRequestDispatcher("member-exception-view.jsp").forward(request, response);
			}

		}
		
		// edit
		else if(action.equals("member-edit.do")) {
			if(repository.update(member) > 0) {
				request.setAttribute("member", member);
				request.setAttribute("exceptionMsg", "edit success");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} 
			else {
				request.setAttribute("exceptionMsg", "회원 업데이트 오류 - 불편을 드려 죄송합니다.");
				request.getRequestDispatcher("member-exception-view.jsp").forward(request, response);
			}
		}
	
		// delete
		else if(action.equals("member-delete.do")){
			member.setEmail((String) session.getAttribute("email"));
			if(repository.delete(member) > 0) {
				session.removeAttribute("email");
				request.setAttribute("exceptionMsg", "delete success");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} 
			else {
				request.setAttribute("exceptionMsg", "회원 업데이트 오류 - 불편을 드려 죄송합니다.");
				request.getRequestDispatcher("member-exception-view.jsp").forward(request, response);
			}
			
		}
		
		else {
			request.setAttribute("exceptionMsg", "요청 오류");
    		request.getRequestDispatcher("member-exception-view.jsp").forward(request, response);
		}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doService(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}

}
