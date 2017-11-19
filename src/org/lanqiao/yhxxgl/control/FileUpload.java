package org.lanqiao.yhxxgl.control;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("wjsc")
public class FileUpload {
	@RequestMapping("fileUpload")
	public String upload(@RequestParam("file")MultipartFile file,Model model,HttpServletRequest request){
		String path  = request.getSession().getServletContext().getRealPath("upload");
		String fileName = file.getOriginalFilename();
		File targetFile = new File(path,fileName);
		
		System.out.println(path);
		System.out.println(fileName);
		System.out.println(targetFile);
		
		if(!targetFile.exists()){
			targetFile.mkdir();
		}
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		//文件回显
		model.addAttribute("url",request.getServletContext().getContextPath()+"/upload/"+fileName);
		//System.out.println("sss   "+request.getServletContext().getContextPath()+"/upload/"+fileName);

		
		return "fileUpload";
	}
}

