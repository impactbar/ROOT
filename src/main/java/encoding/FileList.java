package encoding;

import java.io.IOException;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class FileList {

    Path dir = Paths.get("/NFS_Data/Report");

    public FileList() {
        listFiles();
    }

    public void listFiles() {
        // 읽을 디렉토리 경로를 지정

        // 디렉토리가 있는지와 이게 진짜 디렉토리인지 확인
        if (Files.exists(dir) && Files.isDirectory(dir)) {
            try (DirectoryStream<Path> stream = Files.newDirectoryStream(dir)) {
                // 디렉토리에 있는 모든 파일과 디렉토리를 출력
                for (Path file : stream) {
                    System.out.println(file.getFileName());
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("지정된 경로가 존재하지 않거나 디렉토리가 아닙니다.");
        }
    }

    public static void main(String[] args) {
        new FileList();
    }
}