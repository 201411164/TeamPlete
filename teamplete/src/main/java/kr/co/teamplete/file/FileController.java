package kr.co.teamplete.file;

import java.io.File;
import java.io.UnsupportedEncodingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileController {

	@RequestMapping(value = "/fileDownload")
	public ModelAndView download(@RequestParam("filePath") String filePath,
			@RequestParam("fileNameKey") String fileNameKey, @RequestParam("fileName") String fileName)
			throws UnsupportedEncodingException {

		String fullPath = filePath + "\\" + fileNameKey;
		System.out.println(fullPath);
		File downloadFile = new File(fullPath);

		// String realFileName = new String(fileName.getBytes("utf-8"));
		String realFileName = fileName;
		System.out.println(realFileName);

		ModelAndView mav = new ModelAndView("download", "downloadFile", downloadFile);

		mav.addObject("realFileName", realFileName);

		return mav;
	}

}