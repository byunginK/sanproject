package com.san.spring.login;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	private static Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	MemberService memberService;

	@RequestMapping(value = "login_before.do", method = { RequestMethod.GET, RequestMethod.POST }) // get, post 들어오는 방식 중 하나 선택
	public String login(HttpSession session, Model model) {
		// (외부로부터 들어오는 값(object, String), Model,HttpServletRequest)
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);


		/* 생성한 인증 URL을 View로 전달 */
		model.addAttribute("kakao_url", kakaoUrl);
		 logger.info("login_before has started !!" + kakaoUrl);

		return "login.tiles"; // -> *.jsp 이 아니라 layouts.xml에 설정한 name값으로
	}
	/**
	 * 카카오 로그인 콜백
	 *
	 * @return String
	 * @throws Exception
	 */
	@RequestMapping(value = "login.do", method = { RequestMethod.GET, RequestMethod.POST }) 
	public String getKakaoSignIn(ModelMap model, @RequestParam("code") String code, HttpSession session)
			throws Exception {

		JsonNode userInfo = KakaoController.getKakaoUserInfo(code);
		
		logger.info("login " + new Date());
		logger.info("code : " + code);
		logger.info("userinfo : " + userInfo);
		
		return "mainBbs.tiles";
	}

	@RequestMapping(value = "regi.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String regi() {
		return "regi.tiles";
	}

	@RequestMapping(value = "regiAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String regiAf(MemberDto dto) {
		logger.info("login " + new Date());

		boolean b = memberService.addMember(dto);
		if (b) {
			logger.info("회원가입 되었습니다");
			return "login.tiles";
		}
		logger.info("가입되지 않았습니다");
		return "regi.tiles";
	}

	@RequestMapping(value = "loginAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String loginAf(MemberDto dto, HttpServletRequest req) {

		logger.info("loginAf " + new Date());
		System.out.println(dto);
		MemberDto login = memberService.login(dto);

		if (login != null && !login.getEmail().equals("")) {
			logger.info("login success " + new Date());
			// session저장
			req.getSession().setAttribute("login", login);
			// req.getSession().setMaxInactiveInterval(60 * 60);

			// 이동
			return "redirect:/bbslist.do";
		} else {
			logger.info("login fail " + new Date());
			return "redirect:/login.do";
		}
	}

	@RequestMapping(value = "logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpServletRequest req) {
		// 세션 삭제
		req.getSession().invalidate();

		return "redirect:/login.do";
	}

	@RequestMapping(value = "emailAuths.do")
	public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception {

		String email = request.getParameter("email");
		String authNum = "";
		authNum = RandomNum();
		System.out.println("email: " + email);
		System.out.println("authNum: " + authNum);

		sendEmail(email, authNum);

		ModelAndView mv = new ModelAndView();
		mv.addObject("email", email);
		mv.addObject("authNum", authNum);
		mv.setViewName("email.tiles");

		return mv;
	}

	// 난수 발생()
	private char[] keySet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
			'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a',
			'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
			'w', 'x', 'y', 'z' };

	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i < 10; i++) {
			int idx = (int) (keySet.length * Math.random()); // 62 * 생성된 난수를 Int로 추출 (소숫점제거)
			buffer.append(keySet[idx]);
		}
		return buffer.toString();
	}

	// sendEmail()
	private void sendEmail(String email, String authNum) {
		String host = "smtp.gmail.com";
		String subject = "산스타그램 이메일 인증코드 입니다";
		String fromName = "산스타그램 미도향";
		final String sansta = "sanstaofficial@gmail.com";
		String to = email;
		final String password = "wocppxlxzlopvqqo";

		String content = "산스타그램에 오신것을 진심으로 환영합니다!" + "\n\n 회원가입을 계속 진행하기 위해" + "\n\n 다음의 인증번호로 이메일을 인증해주세요."
				+ "\n\n [    " + authNum + "    ]" + "\n\n 더욱 노력하는 산스타 팀 되겠습니다." + "\n\n -미도향 드림-";

		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", sansta);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(sansta, password);
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(sansta, MimeUtility.encodeText(fromName, "UTF-8", "B")));

			InternetAddress[] address1 = { new InternetAddress(to) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");

			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
