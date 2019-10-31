package com.javatong.fcsttong.controller;

import java.io.File;
import java.util.UUID;
import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.javatong.fcsttong.domain.MemberDTO;
import com.javatong.fcsttong.memberservice.MemberService;

@Controller
@RequestMapping("/upload")
public class UploadController {

	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

	@Inject
	private MemberService memberservice;

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute("memberDTO") MemberDTO memberDTO, Model model) throws Exception {
		logger.info("회원 가입 중......");
		memberDTO.setU_PERMISSION("G");
		logger.info(memberDTO.toString());
		memberservice.join(memberDTO); 
		return "main";
	}

	// public static final String uploadPath="resources/img/profile/";

	// @RequestMapping(value = "/join", method = RequestMethod.POST)
	// public String join(@ModelAttribute("memberDTO") MemberDTO memberDTO,
	// MultipartFile file, Model model) throws Exception {
	// System.out.println("찍히나:"+memberDTO.getU_NAME());
	// memberservice.join(memberDTO);
	//// System.out.println(file.getOriginalFilename());
	//// System.out.println(file.getSize());
	//// System.out.println(file.getContentType());
	////
	//// String savedName = uploadFile(file.getOriginalFilename(),
	// file.getBytes());
	//// model.addAttribute("savedName", savedName);
	// return "/";
	// }
	//
	// private String uploadFile(String originalName, byte[] fileData) throws
	// Exception {
	// UUID uid = UUID.randomUUID();
	// String savedName = uid.toString() + "_" + originalName;
	// File target = new File(uploadPath,savedName);
	// FileCopyUtils.copy(fileData, target);
	// return savedName;
	// }
}
