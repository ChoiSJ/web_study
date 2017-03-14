package servlet;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ProgramDAO;
import vo.ProgramVO;

@MultipartConfig
@WebServlet(urlPatterns="/processmodify")
public class Programmodifyprocess extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String programName = request.getParameter("programname");
		String programDescription = request.getParameter("programdescription");
		String programDescriptionToBr = programDescription.replace("\n", "<br>");
		
		String artistName = request.getParameter("artistname");
		String programDate = request.getParameter("programdate");
		int crowdNumber = Integer.parseInt(request.getParameter("crowdnumber"));
		String announceDate = request.getParameter("announcedate");
		String isVisible = request.getParameter("isvisible");
		int programNo = Integer.parseInt(request.getParameter("program-no"));
		
		// 사진 저장 코드
		Part part = request.getPart("photofile");
		String photofile = getFilename(part);

		// 원래 사진 파일명 저장 코드
		String photofileHidden = request.getParameter("photofile-hidden");
		String galleryDir = "C:\\web_project\\workspace\\semiproject\\WebContent\\photoGallery";
		
		if (photofile.equals("")) {
			photofile = photofileHidden;
		}
		
		if (photofile != null && !photofile.isEmpty()) {
			part.write(galleryDir + "\\" + photofile);
		} 
		
		ProgramVO program = new ProgramVO();
		program.setProgramName(programName);
		program.setArtistName(artistName);
		program.setProgramDate(programDate);
		program.setCrowdnumber(crowdNumber);
		program.setPhotofile(photofile);
		program.setProgramDescription(programDescriptionToBr);
		program.setAnnounceDate(announceDate);
		program.setProgramNo(programNo);
		program.setIsVisible(isVisible);
		
		ProgramDAO dao = new ProgramDAO();
		
		try {
			dao.updateProgram(program);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("admin/programmodifylist.jsp");
	}
	
	private String getFilename(Part part) {
		String headerValue = part.getHeader("content-disposition");
		String[] elements = headerValue.split(";");
		
		for (String el : elements) {
			if (el.trim().startsWith("filename")) {
				return el.substring(el.indexOf("=")+1).replace("\"", "");
			}
		}
		
		return null;
	}
}
