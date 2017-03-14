package servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ReviewDAO;
import vo.ReviewVO;

@MultipartConfig
@WebServlet(urlPatterns="/reviewPhotoEditer")
public class ReviewPhotoEdit extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		Part filept = req.getPart("file");
		String curTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String program = req.getParameter("programname");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String userid = req.getParameter("userid");
		String username = req.getParameter("username");
		String filename = curTime+getFilename(filept);
		String score = req.getParameter("score");
		String folderName = req.getParameter("userid");
		
		ServletContext application = this.getServletContext();
		String reviewDir = application.getRealPath("/reviewbd/reviewPhoto");
		/*String reviewDir = "C:\\web_project\\workspace\\semiproject\\WebContent\\reviewbd\\reviewPhoto";*/
		int reviewNo = Integer.parseInt(req.getParameter("reviewno"));
		int pageNo = Integer.parseInt(req.getParameter("pageno"));
		
		File dir = new File(reviewDir+"\\"+folderName);
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		if(filename != null && !filename.isEmpty()){
			
			// 파일을 폴더에 저장하기
			filept.write(dir+"\\"+filename);
	
		}
		ReviewVO rvo = new ReviewVO();
		rvo.setNo(reviewNo);
		rvo.setTitle(title);
		rvo.setContent(content);
		rvo.setProgramName(program);
		rvo.setUserId(userid);
		rvo.setUserName(username);
		rvo.setScore(Integer.parseInt(score));
		rvo.setFileName(filename);
		
		ReviewDAO dao = new ReviewDAO();
		try {
			dao.reviewEdit(rvo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		resp.sendRedirect("/reviewbd/reviewDetail.jsp?no="+reviewNo+"&pno="+pageNo);
	}
	

	private String getFilename(Part part){
		String headerValue = part.getHeader("content-disposition");
		System.out.println(headerValue);
		String[] elements = headerValue.split(";");
		for(String el : elements){
			// filename 이라는 이름으로 시작하는지 체크
			if(el.trim().startsWith("filename")){
				return el.substring(el.indexOf("=")+1).replace("\"", "");
			}
		}
		return null;
	}
}

