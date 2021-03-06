package repo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig
public class FileUploadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part part = request.getPart("upfile");
		String filename = this.getFilename(part);
		
		if (filename != null && !filename.isEmpty()) {
			String directory = "c:/web_project/repo/";
			part.write(directory + filename);
		}
		
		response.sendRedirect("filelist.jsp");
	}
	
	private String getFilename(Part part) {
		String headerValue = part.getHeader("content-disposition");
		String[] elements = headerValue.split(";");
		
		for (String el : elements) {
			if (el.trim().startsWith("filename")) {
				return el.substring(el.indexOf("=") + 1).replace("\"", "");
			}
		}
		
		return null;
	}
}
