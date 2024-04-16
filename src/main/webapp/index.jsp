<%@ page import="java.nio.file.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>파일 목록</title>
</head>
<body>
파일목록 : <br> <br>
<%
    Path dir = Paths.get("/NFS_Data/Report");

    if (Files.exists(dir) && Files.isDirectory(dir)) {
        try (DirectoryStream<Path> stream = Files.newDirectoryStream(dir)) {
            for (Path file : stream) {
                out.println(file.getFileName() + "<br/>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    } else {
        out.println("지정된 경로가 존재하지 않거나 디렉토리가 아닙니다.");
    }
%>
hit test code 8
</body>
</html>
