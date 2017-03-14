package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns="/upload")
public class photoUpload extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String programname = req.getParameter("programname");
		String programartist = req.getParameter("programartist");
		String programdate = req.getParameter("programdate");
		int crowdnumber = Integer.parseInt(req.getParameter("crowdnumber"));
		String programdescription = req.getParameter("programdescription");
		
		if (programdescription.equals("")) {
			resp.setCharacterEncoding("utf-8");
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter writer = resp.getWriter();
			writer.println("<script type='text/javascript'>");
			writer.println("alert('공연 내용을 입력하세요.');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.flush();
			writer.close();
			
			return;
		}
		
		String programdescriptionToBr = programdescription.replace("\n", "<br>");
		
		String announcedate = req.getParameter("announcedate");
		
		Part part = req.getPart("photofile");
		String photofile = getFilename(part);
		String galleryDir = "C:\\web_project\\workspace\\semiproject\\WebContent\\photoGallery";
		
		if(photofile != null && !photofile.isEmpty()) {
			part.write(galleryDir + "\\" + photofile);
		}
		
		ProgramVO program = new ProgramVO();
		program.setProgramName(programname);
		program.setArtistName(programartist);
		program.setProgramDate(programdate);
		program.setCrowdnumber(crowdnumber);
		program.setPhotofile(photofile);
		program.setProgramDescription(programdescriptionToBr);
		program.setAnnounceDate(announcedate);
		
		ProgramDAO dao = new ProgramDAO();
		
		try {
			dao.addProgram(program);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		resp.sendRedirect("/program/program.jsp");
	}
	
	private String getFilename(Part part){
		String headerValue = part.getHeader("content-disposition");
		String[] elements = headerValue.split(";");
		
		for(String el:elements){
			
			if(el.trim().startsWith("filename")){
				return el.substring(el.indexOf("=")+1).replace("\"", "");
			}
		}
		return null;
	}
}
