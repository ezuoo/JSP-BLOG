package controller;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import domain.Blog;
import domain.Member;
import repository.BlogDAOImpl;
import repository.MemberDAOImpl;

/**
 * Servlet implementation class BlogController
 */
@WebServlet({"/blog-update.do", "/blog-update-form.do", "/blog-create.do", "/blog-read.do", "/blog-list.do", "/blog-delete.do"
	, "/BlogController", "/blog-delete-form.do"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 50)

public class BlogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BlogController() {
        super();
        // TODO Auto-generated constructor stub
    }
    MemberDAOImpl memberRepo = null;
    Member member = null;
    BlogDAOImpl repository = null;
    Blog blog = null;
    List<Blog> blogList = null;
    
    private static final String SAVE_DIR = "files";
    private String partName = null;
    private String partValue = null;
    private int index = 0;
    private int page = 0;
    private int pageMax = 0;
    
    protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();		
    	request.setCharacterEncoding("UTF-8"); 
    	repository = new BlogDAOImpl();
    	memberRepo = new MemberDAOImpl();
    	
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/") + 1);
		
		if(action.equals("blog-list.do")) {
			page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
			index = request.getParameter("page") == null ? 0 : (Integer.parseInt(request.getParameter("page")) - 1) * 3 ;
			
			pageMax = repository.cnt() / 3 == 0 ? (repository.cnt() / 3) : (repository.cnt() / 3) + 1;
			
			System.out.println("index : " + index);
			System.out.println("pageMax : " + pageMax);
			blogList = repository.readList(index);
			
			request.setAttribute("bloglist", blogList);
			request.setAttribute("page", page);
			request.setAttribute("pageMax", pageMax);
			request.getRequestDispatcher("blog-list-view.jsp").forward(request, response);
			/*
			if((blogList = repository.readList()) != null) {
				request.setAttribute("bloglist", blogList);
				request.getRequestDispatcher("blog-list-view.jsp").forward(request, response);
			} else {
				request.setAttribute("exceptionMsg", "블로그 목록 가져오기 오류 - 불편을 드려 죄송합니다.");
				request.getRequestDispatcher("blog-exception-view.jsp").forward(request, response);
			}*/
		}
		
		else if(action.equals("blog-read.do")) {
			Blog retBlog = null;
			blog = new Blog();
			blog.setNo(Integer.parseInt(request.getParameter("no")));
			
			if((retBlog = repository.read(blog)) != null) {
				request.setAttribute("blog", retBlog);
				request.getRequestDispatcher("blog-read-view.jsp").forward(request, response);
			} else {
				request.setAttribute("exceptionMsg", "블로그 읽기 오류 - 불편을 드려 죄송합니다.");
				request.getRequestDispatcher("blog-exception-view.jsp").forward(request, response);
			}
		}
		
		// 글 생성
		else if(action.equals("blog-create.do")) {
			String appPath = request.getServletContext().getRealPath("");     	
	    	String savePath = appPath + File.separator + SAVE_DIR;     
	    	
	    	File fileSaveDir = new File(savePath);     	
	    	if( !fileSaveDir.exists() ) { 
	    		fileSaveDir.mkdir(); 
	    	} 
	    	
	    	Collection<Part> parts = request.getParts();
	    	for (Part part : parts) {
	    		partName = part.getName(); // 파라미터의 이름 가져오기 : productImage 
	    		if(part.getContentType() != null) {
	    			// 파일 부분을 처리
	    			partValue = getFileName(part); // part 객체로 부터 값(파일 이름)을 가져옴
	    			if(partValue != null && !partValue.isEmpty()) {
	    				part.write(savePath + File.separator + partValue); // 업로드 담당하는 메소드
	    			}
	    		}
	    		else {
	    			// 파일이 아닌 파라미터 처리    			
	    			partValue = request.getParameter(partName);
	    		}   
	    		request.setAttribute(partName, partValue); // productImage
	    	}    	
	
	    	blog = new Blog();
	    	blog.setTitle((String) request.getAttribute("title"));
	    	blog.setContent((String) request.getAttribute("content"));
	    	blog.setFilepath((String) request.getAttribute("filepath"));
	    	blog.setBlogger((String) request.getAttribute("blogger"));
	    	blog.setReg_date_time((String) request.getAttribute("reg_date_time"));
	    	
	    	if(repository.create(blog) > 0) {
	    		response.sendRedirect("blog-list.do");	    		// 상품 등록 성공, insert문 정상 동작
	    	} else {
	    		request.setAttribute("exceptionMsg", "블로그 등록 오류 - 불편을 드려 죄송합니다.");
				request.getRequestDispatcher("blog-exception-view.jsp").forward(request, response);
	    	}
	    	
		}
		
		else if(action.equals("blog-update-form.do")) {
			Blog retBlog = null;
			blog = new Blog();
			blog.setNo(Integer.parseInt(request.getParameter("no")));
			if((retBlog = repository.read(blog)) != null) {
				request.setAttribute("blog", retBlog);
				request.getRequestDispatcher("blog-update-form.jsp").forward(request, response);
			} else {
				request.setAttribute("exceptionMsg", "블로그 업데이트를 위한 읽기 오류 - 불편을 드려 죄송합니다.");
				request.getRequestDispatcher("blog-exception-view.jsp").forward(request, response);
			}
		}
		
		else if(action.equals("blog-update.do")) {
			String appPath = request.getServletContext().getRealPath("");     	
	    	String savePath = appPath + File.separator + SAVE_DIR;     
	    	Blog retBlog = null;
	    	File fileSaveDir = new File(savePath);     	
	    	if( !fileSaveDir.exists() ) { 
	    		fileSaveDir.mkdir(); 
	    	} 
	    	
	    	Collection<Part> parts = request.getParts();
	    	for (Part part : parts) {
	    		partName = part.getName(); // 파라미터의 이름 가져오기 : productImage 
	    		if(part.getContentType() != null) {
	    			// 파일 부분을 처리
	    			partValue = getFileName(part); // part 객체로 부터 값(파일 이름)을 가져옴
	    			if(partValue != null && !partValue.isEmpty()) {
	    				part.write(savePath + File.separator + partValue); // 업로드 담당하는 메소드
	    			}
	    		}
	    		else {
	    			// 파일이 아닌 파라미터 처리    			
	    			partValue = request.getParameter(partName);
	    		}   
	    		request.setAttribute(partName, partValue); // productImage
	    	}    	
	
	    	blog = new Blog();
	    	blog.setNo(Integer.parseInt((String) request.getAttribute("no")));
	    	blog.setTitle((String) request.getAttribute("title"));
	    	blog.setContent((String) request.getAttribute("content"));
	    	blog.setFilepath((String) request.getAttribute("filepath"));
	    	blog.setReg_date_time((String) request.getAttribute("reg_date_time"));
	   
			if(repository.update(blog) > 0) {
				if((retBlog = repository.read(blog)) != null) {
					request.setAttribute("blog", retBlog);
					request.getRequestDispatcher("blog-read-view.jsp").forward(request, response);
				} else {
					request.setAttribute("exceptionMsg", "블로그 읽기 오류 - 불편을 드려 죄송합니다.");
					request.getRequestDispatcher("blog-exception-view.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("exceptionMsg", "블로그 업데이트 오류 - 불편을 드려 죄송합니다.");
				request.getRequestDispatcher("blog-exception-view.jsp").forward(request, response);
			}
		}
		
		else if(action.equals("blog-delete-form.do")) {
			blog = new Blog();
			blog.setNo(Integer.parseInt((String) request.getParameter("no")));
			
			request.setAttribute("no", blog.getNo());
			request.getRequestDispatcher("blog-delete-form.jsp").forward(request, response);	    	
		}
		
		else if(action.equals("blog-delete.do")) {
			
			blog = new Blog();
			blog.setNo(Integer.parseInt((String) request.getParameter("no")));
			
			member = new Member();
	    	member.setEmail((String) request.getParameter("email"));
	    	member.setPw((String) request.getParameter("pw"));
	    	
	    	if(memberRepo.login(member) == 1) {
	    		repository.delete(blog);
	    		response.sendRedirect("blog-list.do");
	    	}
	    	else {
	    		request.setAttribute("exceptionMsg", "계정 조회 오류 - 비밀번호를 다시 입력해주세요.");
				request.getRequestDispatcher("blog-exception-view.jsp").forward(request, response);
	    	}
		}
		
		else {
			request.setAttribute("exceptionMsg", "잘못된 요청입니다. - 불편을 드려 죄송합니다.");
			request.getRequestDispatcher("blog-exception-view.jsp").forward(request, response);
		}
	}
    
    private String getFileName(Part part) {
    	String contentDisp = part.getHeader("content-disposition");
    	String[] items = contentDisp.split(";"); 
    	for (String s : items) { 
    		if (s.trim().startsWith("filename")) {
    			return s.substring(s.indexOf("=") + 2, s.length()-1); 
    			// return s.substring(s.indexOf("=") + 1).trim().replace("\"",  ""); 
    			// ;filename="induk.txt" -> induk.txt" -> " 교체 함  -> induk.txt
    		} 
    	}    	
    	return "";
    } 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}

}
