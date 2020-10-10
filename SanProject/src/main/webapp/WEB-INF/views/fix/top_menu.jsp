<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="mainLogo_wrap">
	<div id="mainLogo" style="padding: 0px">
		<a href="./bbslist.do"><img alt="" src="image/sanlogo.png"
			width="100px" height="90px"> </a>
	</div>
</div>
<div id="allSearch_wrap">
	<div class="ui left icon action input" id="allSearch">
		<i class="search icon"></i><input type="text" placeholder="Search" id="searchInput">
		<div class="ui blue submit button" id="searchBtn">Search</div>
	</div>
</div>
<div id="menulist_wrap">
	<div id="menulist">
		<ul class="topListMenu">
			<li><a href="./mainBbswrite.do"><i
					class="large edit outline icon"></i></a></li>
			<li class="menu"><a><i class="large th list icon"></i></a>
				<ul class="hide">
					<li><a href="mountainInformation.do">산 정보</a></li>
					<li><a>Q&A</a></li>
				</ul></li>
			<li><a href="#none"><i class="large comment outline icon"></i></a>
			</li>
			<li><a href="#none"><i class="large thumbs up outline icon"></i></a>
			</li>
			<li class="menu"><a><i class="large user icon"></i></a>
				<ul class="hide">
					<li><a href="logout.do">로그아웃</a></li>
					<li><a>마이페이지</a></li>
					<li><a>설정</a></li>
				</ul></li>
		</ul>
	</div>
</div>
<div style="clear: both"></div>

<script>
	$(document).ready(function() {
		$(".menu a").click(function() {
			var submenu = $(this).next("ul");
			if (submenu.is(":visible")) {
				submenu.slideUp();
			} else {
				submenu.slideDown();
			}
		});

		$("#searchBtn").click(function(){
			let searchWord = $("#searchInput").val();
			if(searchWord == ""){
				alert("검색어를 입력해 주세요");
			}else{
				location.href="goMainSearch.do?searchWord="+searchWord+"";
			}
			
		});
	});
</script>