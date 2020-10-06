package com.san.spring.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.san.spring.login.MemberDto;

@Aspect

public class LogAop {
	@Around("within(com.san.spring.controller.*) or within(com.san.spring.daoimpl.*)")
	
	public Object loggerAop(ProceedingJoinPoint joinPoint)throws Throwable{
		String signatureStr = joinPoint.getSignature().toShortString();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		/* 추후 자동 로그아웃 시 주석 해제
		if(request != null) {
			HttpSession session = request.getSession();
			MemberDto login = (MemberDto)session.getAttribute("login");	//세션이 남아있는지 체크
			if(login == null) {
				return "redirect:/sessionOut.do";
			}
		}
		*/
		try {
			System.out.println("AOP:"+signatureStr+" Method processed");
			Object obj = joinPoint.proceed();
			
			return obj;
		}finally {
			
		}
	}

}
