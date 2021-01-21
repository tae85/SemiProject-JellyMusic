<link href="${pageContext.request.contextPath}/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/main_login.css"
	rel="stylesheet" type="text/css">
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>문의글 게시판</title>
<style>
.main_content {
	background: linear-gradient(to right, rgba(22, 25, 41, 0) 30%,
		rgba(22, 25, 41, 0.25) 55%, rgba(22, 25, 41, 0.5) 70%,
		rgba(22, 25, 41, 0.75) 75%, rgba(22, 25, 41, 1) 100%),
		linear-gradient(to bottom, rgba(22, 25, 41, 0) 80%,
		rgba(22, 25, 41, 0.25) 85%, rgba(22, 25, 41, 0.5) 90%,
		rgba(22, 25, 41, 0.75) 95%, rgba(22, 25, 41, 1) 100%),
		url('${pageContext.request.contextPath}/image/hostile-886034.jpg');
	background-size: calc(100% - 259px);
	background-repeat: no-repeat;
}

#fix_logo_img {
	background-image:
		url('${pageContext.request.contextPath}/image/logo.svg');
	background-size: 45px;
}

#j_img {
	background-image:
		url('${pageContext.request.contextPath}/image/logo.svg');
	background-size: 100px;
}
</style>
<style>
.container {
	position: relative;
	color: rgb(244, 244, 244);
	width: 1200px;
	min-height: 680px;
	left: 379px;
}

table{
               width: 1080px;
               color : white;
               font-size: 15px;
               box-sizing: border-box;
               border-collapse: collapse;
           }
           table tr td{
                height: 50px;
               border-top: 1px solid white;
                border-bottom: 1px solid white;
                text-align:center;
                line-height:50px;
           }
           
           tr:nth-child(1) td:nth-child(1){
            border-top: 2px solid white;
            
           }
           .list_btn{
               float: right;
               border-radius: 3px;
               background-color: #ea3855;
               border: none;
               width: 80px;
               height: 30px;
           }
           .write_title{
             font-weight: 700;
             text-align: center;
             border-right: 1px solid white;
           }
           .write_column2{
                height: 400px;
           }
           #inputCont {
               height: 350px;
               width: 99%;
           }
           #subject input{
               width: 99%;
               height:99%
           }
           
           #button input{
                border-radius: 3px;
               background-color: #ea3855;
               border: none;
               width: 80px;
               height: 30px;
               color : white;
               margin-left: 20px;
           }
           table tr:nth-child(1) td:nth-child(1){
                border-top: 0;
                height: 80px;
           }
           table tr:last-child td{
                border-bottom: 0;
                height: 80px;
                text-align: right;
            }
            #secretO, #secretX{
                margin-left:8px;
                margin-right:15px;
            }
            h1{
            	font-size:2em;
            	font-weight:bold;
            }

</style>
</head>
<body>
<%
	int que_no = (request.getParameter("que_no")!=null) ? Integer.parseInt(request.getParameter("que_no")):0;
	String que_ref= (request.getParameter("que_ref")!=null) ? request.getParameter("que_ref"):"0";
	String que_step= (request.getParameter("que_step")!=null) ? request.getParameter("que_step"):"0";
	String que_level= (request.getParameter("que_level")!=null) ? request.getParameter("que_level"):"0";
%>
	<nav id="fix_side">
		<div id="fix_logo">
			<div id="fix_logo_img"></div>
			<a href="mainServlet" id="fix_logo_title">Jelly Music</a>
		</div>
		<div id="fix_user">
			<img src="${pageContext.request.contextPath}/image/005-user.svg"
				id="fix_prof">
			<c:if test="${not empty himem }">
				<c:forEach items="${himem }" var="v" varStatus="s">
					<a href="#">Hello, ${v.mem_aka }</a>
				</c:forEach>
			</c:if>
		</div>
		<div id="fix_side_menu">
			<div>
				<input type="radio" name="fix_drp" id="login"> <input
					type="radio" name="fix_drp" id="song"> <input type="radio"
					name="fix_drp" id="myplaylist"> <input type="radio"
					name="fix_drp" id="recommend"> <input type="radio"
					name="fix_drp" id="help"> <input type="radio"
					name="fix_drp" id="membership">
				<div class="fix_each">
					<img
						src="${pageContext.request.contextPath}/image/007-settings.svg"
						class="fix_menu_icon"> <label for="login"
						class="fix_each_menu">마이페이지</label>
				</div>
				<ul>
					<li><a href="#">구매내역</a></li>
					<li><a href="#">보관함</a></li>
					<li><a href="#">계정설정</a></li>
					<li><a href="#">로그아웃</a></li>
				</ul>
				<div class="fix_each">
					<img
						src="${pageContext.request.contextPath}/image/003-play-button.svg"
						class="fix_menu_icon"> <label for="song"
						class="fix_each_menu" onclick="location.href='mainListCtrl.do';">노래</label>
				</div>
				<ul>
					<li><a href="#">실시간 차트</a></li>
					<li><a href="#">하트 차트</a></li>
					<li><a href="#">장르</a></li>
					<li><a href="#">무드별</a></li>
				</ul>
				<div class="fix_each">
					<img src="${pageContext.request.contextPath}/image/002-music-1.svg"
						class="fix_menu_icon"> <label for="myplaylist"
						class="fix_each_menu">마이플레이리스트</label>
				</div>
				<div class="fix_each">
					<img src="${pageContext.request.contextPath}/image/001-music.svg"
						class="fix_menu_icon"> <label for="recommend"
						class="fix_each_menu">나만의 추천</label>
				</div>
				<div class="fix_each">
					<img
						src="${pageContext.request.contextPath}/image/008-internet.svg"
						class="fix_menu_icon"> <label for="help"
						class="fix_each_menu">고객지원센터</label>
				</div>
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">Q&A</a></li>
					<li><a href="#">자주하는 질문</a></li>
					<li><a href="#">로그아웃</a></li>
				</ul>
				<div class="fix_each">
					<img src="${pageContext.request.contextPath}/image/006-star.svg"
						class="fix_menu_icon"> <label for="membership"
						class="fix_each_menu">이용권구매</label>
				</div>
			</div>
		</div>
		<div class="fix_btn">
			<%-- <c:if test="${not empty scm }">
                        <c:forEach items="${scm }" var="v" varStatus="s">
                            <input type="hidden" name="mu_no" value=${v.mu_no }>
                            <input type="hidden" id="mem_id" name="mem_id" value=${v.mem_id }>
                            <button class="fix_player_btn" onclick="window.open('<%=request.getContextPath()%>/playerCtrl.do?mu_no=${v.mu_no}','','width=1200,height=720')">Player</button>
                        </c:forEach>
                    </c:if> --%>
		</div>
	</nav>
	<header class="fix_header">
		<input type="text" class="fix_searchbx">
		<div class="fix_search"></div>
		<div class="fix_realtime">
			<div class="fix_rt_div">
				<div id='fix_m_scroller'>
					<c:if test="${not empty searlist}">
						<c:forEach items="${searlist }" var="vo" varStatus="s">
							<c:set var="sum" value="${sum+1 }" />
							<div class='fix_item'>
								<a class='rt_link' href='#'>${sum }. ${vo.sear_word }
									<div class="tri"></div>
								</a>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
		<table id="rtdrop">
			<c:if test="${not empty searlist}">
				<c:forEach items="${searlist }" var="vo" varStatus="s">
					<c:set var="sum2" value="${sum2+1 }" />
					<tr>
						<td width="10%">${sum2 }.</td>
						<td width="80%"><a href="#">${vo.sear_word }</a></td>
						<td width="10%">
							<div class="tri"></div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</header>
	<div class="main_content">
		<div class="container">
			<br><br><br><h1>문의글 작성</h1><br><br><br>
	<form
		enctype="multipart/form-data"
		method="post"
		action="<%=request.getContextPath() %>/postWriteServlet.lo"
		onsubmit="return writefrm_submit();">
		<input type="hidden" name="que_no" value="<%=que_no %>">
		<input type="hidden" name="que_ref" value="<%=que_ref %>">
		<input type="hidden" name="que_step" value="<%=que_step %>">
		<input type="hidden" name="que_level" value="<%=que_level %>">
		<input type="hidden" name="writer" value="${ssLogInfo.mem_id}${mng_id}">
		<table border="1">
			<tr>
			</tr>
			<tr>
			<td>작성자ID</td>
			<td id="writer">${ssLogInfo.mem_id }${mng_id }</td>
			</tr>
			<tr>
			<td>제목</td>
			<td id="subject"><input type="text" name="que_name" id="inputSub" placeholder="제목을 입력해 주세요" required></td>
			</tr>
			<tr>
			<td>내용</td>
			<td id="content"><input type="text" name="que_content" id="inputCont" placeholder="1200자 내로 입력해 주세요" required></td>
			</tr>
			<tr>
			<td>파일선택</td>
			<td id="file"><input type="file" name="que_file"></td>
			</tr>
			<tr>
			<td>비밀글여부</td>
			<td><label for="secretO">나만보기</label><input type="radio" name="que_secret" value="O" id="secretO" checked>
				<label for="secretX">전체공개</label><input type="radio" name="que_secret" value="X" id="secretX"></td>
			</tr>
			<tr>
			<td colspan="2" id="button">
				<input type="submit" value="글등록">
				<input type="reset" value="다시작성">
				<input type="button" value="글목록" onclick="window.location='postListServlet'">
			</td>
			</tr>
		</table>
	</form>
		</div>


	</div>
	<footer id="fix_footer">
		<hr id="fix_fline">
		<div id="fix_ft">
			<div id="fix_copy" class="fix_fc">Copyright ⓒ 2020 Jelly. All
				rights reserved.</div>
			<div id="fix_national" class="fix_fc">Republic of Korea</div>
			<div id="fix_link" class="fix_fc">
				<a href="#">이용약관</a> | <a href="#">개인정보처리방침</a> | <a href="#">고객센터</a>
				| <a href="#">이메일주소무단수집거부</a>
			</div>
			<div id="fix_info" class="fix_fc">제작자 : 김경태 김수민 곽은지 김지용 장재혁${idLog }</div>
		</div>
	</footer>
</body>
</html>