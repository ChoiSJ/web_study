package upload;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.GalleryDAO;
import vo.GalleryVO;

// 멀티파트요청을 처리할 수 있는 서블릿으로 지정한다.
@MultipartConfig
@WebServlet(urlPatterns="/upload.hta")
public class UploadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 입력필드와 단순 텍스트 값 가져오기
		String username = request.getParameter("username");
		String description = request.getParameter("description");
		System.out.println("작성자 이름:" + username);
		System.out.println("설명:" + description);
		
		// 첨부파일 처리하기
		Part part = request.getPart("photofile");
		String filename = getFilename(part);
		
		// 실제 경로 알아내기
		ServletContext application = this.getServletContext();
		String galleryDir = application.getRealPath("gallery");
		System.out.println("갤리러 디렉토리 경로:" + galleryDir);
		
		// 첨부파일이 있는 겅우
		if (filename != null && !filename.isEmpty()) {
			System.out.println("첨부파일명:" + filename);
			
			// 파일을 gallery 폴더에 저장하기
			part.write(galleryDir + "/" + filename);
		}
		
		GalleryVO vo = new GalleryVO();
		vo.setUsername(username);
		vo.setDescription(description);
		vo.setFilename(filename);
		
		GalleryDAO dao = new GalleryDAO();
		
		try {
			dao.addGalleryVO(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("gallery.jsp");
	}
	
	private String getFilename(Part part) {
		String headerValue = part.getHeader("content-disposition");
		String[] elements = headerValue.split(";");
		
		for (String el : elements) {
			// filename 이라는 이름으로 시작하는지 체크
			if (el.trim().startsWith("filename")) {
				return el.substring(el.indexOf("=") + 1).replace("\"", "");
			}
		}
		
		return null;
	}
}
