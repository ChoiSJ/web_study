package repo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;

@WebServlet(urlPatterns="/download")
public class FileDownloadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String directory = "c:/web_project/repo";
		String filename = request.getParameter("name");
		
		String encodedFilename = URLEncoder.encode(filename, "utf-8");
		System.out.println(encodedFilename);
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=" + filename);
		
		FileInputStream fis = new FileInputStream(new File(directory, filename));
		OutputStream os = response.getOutputStream();
		
		/*
		byte[] buf = new byte[1024*8];
		int len = 0;
		
		while ((len=fis.read(buf)) != -1) {
			os.write(buf, 0, len);
		}
		*/
		
		IOUtils.copy(fis, os);
	}
}
