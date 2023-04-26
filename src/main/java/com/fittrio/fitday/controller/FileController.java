package com.fittrio.fitday.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;

@Controller
public class FileController {

    @PostMapping("/board/mission/form")
    public String uploadFile(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "업로드 할 파일을 선택해주세요.");
            return "redirect:/board/mission/form";
        }

        try {
            // 업로드된 파일을 저장할 디렉토리 생성
            File uploadDir = new File("uploads");
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // 업로드된 파일을 실제 디렉토리에 저장
            File uploadedFile = new File(uploadDir.getAbsolutePath(), file.getOriginalFilename());
            file.transferTo(uploadedFile);

            // 파일 업로드 성공 시 메시지 전달
            redirectAttributes.addFlashAttribute("message", "File uploaded successfully!");
            return "redirect:/board/mission/form";
        } catch (IOException e) {
            // 파일 업로드 실패 시 에러 메시지 전달
            redirectAttributes.addFlashAttribute("message", "File upload failed: " + e.getMessage());
            return "redirect:/board/mission/form";
        }
    }

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public String handleMaxSizeException(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("message", "File size should be less than 20MB");
        return "redirect:/board/mission/form";
    }
}

