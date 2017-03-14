<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.FreeDAO"%>
<%@page import="vo.FreeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="../common/header.jsp" %>
<%
	// 한글처리를 위한 인코딩 설정
	request.setCharacterEncoding("utf-8");
	
	// 파일이 저장될 서버의 경로. 되도록이면 getRealPath를 이용하자.
	// String savePath = "D:/Projects/workspace/projectName/WebContent/folderName";
	String savePath = "C:/web_project/workspace/semiproject/WebContent/freebd/gallery";
	
	// 파일 크기 15MB로 제한
	int sizeLimit = 1024*1024*15;
	
	//  ↓ request 객체,               ↓ 저장될 서버 경로,       ↓ 파일 최대 크기,    ↓ 인코딩 방식,       ↓ 같은 이름의 파일명 방지 처리
	// (HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding, FileRenamePolicy policy)
	// 아래와 같이 MultipartRequest를 생성만 해주면 파일이 업로드 된다.(파일 자체의 업로드 완료)
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	 
	// MultipartRequest로 전송받은 데이터를 불러온다.
	// enctype을 "multipart/form-data"로 선언하고 submit한 데이터들은 request객체가 아닌 MultipartRequest객체로 불러와야 한다.
	String title = multi.getParameter("title");
	String description = multi.getParameter("description");
	 
	// 전송받은 데이터가 파일일 경우 getFilesystemName()으로 파일 이름을 받아올 수 있다.
	String fileName = multi.getFilesystemName("filesrc");
	 
	// 업로드한 파일의 전체 경로를 DB에 저장하기 위함
	String m_fileFullPath = savePath + "/" + fileName;
	 
	 
	// 데이터들을 담을 그릇인 DTO(혹은 Bean) 객체를 생성 후, 데이터들을 set해준다.
	// VO에 대입
	FreeVO free = new FreeVO();
	free.setTitle(title);
	free.setContent(description);
	free.setWriter(user.getUserId());
	free.setFilepath(m_fileFullPath);
	free.setFilename(fileName);
	 
	FreeDAO dao = new FreeDAO();
	dao.addFree(free);
	response.sendRedirect("freelist.jsp?pno=1");
	
%>