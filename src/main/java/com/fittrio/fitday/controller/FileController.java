package com.fittrio.fitday.controller;

import com.fittrio.fitday.dto.BoardDTO;
import com.fittrio.fitday.service.BoardService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

@Controller
public class FileController {

    @Autowired
    @Qualifier("boardService")
    BoardService boardService;

    @PostMapping("/board/mission/form")
    public String uploadFile(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes, @Valid BoardDTO dto, BindingResult result) {

        if (result.hasErrors()) {
            System.out.print(result);
            // 유효성 검사 실패 시 처리
            redirectAttributes.addFlashAttribute("message", "게시글 등록에 실패하였습니다.");
            return "redirect:/board/mission/form";
        }

        // 파일 업로드 처리
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "파일을 선택해주세요.");
            return "redirect:/board/mission/form";
        }

        try {
            // 업로드된 파일을 저장할 디렉토리 생성
            File uploadDir = new File("src/main/resources/static/uploads");
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // 업로드된 파일을 실제 디렉토리에 저장
            File uploadedFile = new File(uploadDir.getAbsolutePath(), file.getOriginalFilename());
            file.transferTo(uploadedFile);

            // 파일 업로드 성공 시 메시지 전달
            dto.setFileName(uploadedFile.getName());
            dto.setFilePath(uploadedFile.getPath());
            boardService.insertMission(dto);

            redirectAttributes.addFlashAttribute("message", "파일과 게시글이 성공적으로 업로드 되었습니다!");

            return "redirect:/board/mission/list";

        } catch (IOException e) {
            // 파일 업로드 실패 시 에러 메시지 전달
            redirectAttributes.addFlashAttribute("message", "파일 업로드에 실패하였습니다.: " + e.getMessage());
            return "redirect:/board/mission/form";
        }


    }

    //파일 수정
    @PostMapping("/mission/update/{boardSeq}")
    public String updateMission(
            @RequestParam(name="file", required = false) MultipartFile file,
            @PathVariable("boardSeq") int boardSeq, BoardDTO dto
    ) throws IOException {

        BoardDTO origin = boardService.getOneBoard(boardSeq);

        if (file == null){
            //새 파일이 없을 때
            System.out.print(dto.toString());
            System.out.print(dto.getFileName());
//            dto.setFileName(dto.getFileName());
//            dto.setFilePath(dto.getFilePath());
            dto.setFileName(origin.getFileName());
            dto.setFilePath(origin.getFilePath());

        } else {
            //새 파일이 있을 때
                File f = new File(origin.getFilePath());

                if (f.exists()) { // 파일이 존재하면
                    f.delete(); // 파일 삭제
                }

//            UUID uuid = UUID.randomUUID();
//            String fileName = uuid + "_" + file.getOriginalFilename();
//            File saveFile = new File(projectPath, fileName);
//            file.transferTo(saveFile);

                File uploadDir = new File("src/main/resources/static/uploads");
                File saveFile = new File(uploadDir.getAbsolutePath(), file.getOriginalFilename());
                file.transferTo(saveFile);
                System.out.print("TEST :: " + file.getOriginalFilename());

                dto.setFileName(saveFile.getName());
                dto.setFilePath(saveFile.getPath());


        }
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("dto", dto);
        map.put("boardSeq", boardSeq);
        boardService.updateMission(map);
        System.out.print(dto.toString());

        return "redirect:/board/mission/list";
    }



    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public String handleMaxSizeException(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("message", "10MB 이하 파일만 업로드 가능합니다.");
        return "redirect:/board/mission/form";
    }

}

