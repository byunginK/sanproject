<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div style="width: 100%; height: 100%">
<h1>${qna.title }</h1>
<h5>작성자</h5><span>${qna.nickname}</span>
<h5>작성일자</h5><span>${qna.wdate }</span>
<h5>문의 내용</h5>
<textarea style="width: 400; height: 300">${qna.content }</textarea>
</div>