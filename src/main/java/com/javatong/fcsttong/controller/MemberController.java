package com.javatong.fcsttong.controller;

import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javatong.fcsttong.domain.MemberDTO;
import com.javatong.fcsttong.domain.MemberVO;
import com.javatong.fcsttong.memberservice.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService memberservice;

	@RequestMapping(value = "/loginsuccess", method = RequestMethod.POST)
	public void loginsuccess(@ModelAttribute("memberDTO") MemberDTO memberDTO, HttpSession session, Model model)
			throws Exception {
		MemberVO memberVO = memberservice.login(memberDTO);
		// System.out.println("아이디 파라미터 : " + memberDTO.getU_EMAIL());
		// System.out.println("패스워드 파라미터 : " + memberDTO.getU_PWD());
		if (memberVO == null) {
			return;
		}
		model.addAttribute("memberVO", memberVO);
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		memberservice.logout(session);
		System.out.println("세션이 해제되었습니다.");
		return "redirect:/";
	}

	@RequestMapping(value = "/usercount", method = RequestMethod.GET)
	public String usercount(Model model) throws Exception {
		int usercount = memberservice.usercount();
		model.addAttribute("usercount", usercount);
		return "/member/usercount";
	}

	@RequestMapping(value = "/dupliccheck", method = RequestMethod.GET)
	public String dupliccheck(@RequestParam("user_email") String U_EMAIL, Model model) throws Exception {
		String chekedEmail = memberservice.dupliccheck(U_EMAIL);
		if (chekedEmail != null) {
			chekedEmail = "NO";
		} else {
			chekedEmail = "YES";
		}
		System.out.println(chekedEmail);
		model.addAttribute("chekedEmail", chekedEmail);
		return "/member/dupliccheck";
	}

	@RequestMapping(value = "/gotoJoin", method = RequestMethod.GET)
	public String gotoJoin() throws Exception {
		return "/member/join";
	}
	
	@RequestMapping(value = "/gotoMain", method = RequestMethod.GET)
	public String gotoMain() throws Exception {
		return "redirect:/";
	}
	
	@RequestMapping(value = "/gotoAllfcst", method = RequestMethod.GET)
	public String gotoAllfcst() throws Exception {
		return "/forecast/overall_weather";
	}

	@RequestMapping(value = "/loginfail", method = RequestMethod.GET)
	public void loginfail(HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('계정정보가 없습니다. 다시 로그인 해주세요.')");
		out.println("location.href='/';");
		out.print("</script>");
	}
}
