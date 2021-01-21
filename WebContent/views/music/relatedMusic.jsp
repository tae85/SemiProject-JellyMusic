<link href="${pageContext.request.contextPath}/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/musicMore.css"
	rel="stylesheet" type="text/css">
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><c:forEach items="${info }" var="v">${v.mu_name }의 검색결과</c:forEach>

</title>
<script src="https://kit.fontawesome.com/3929e16ef5.js"
	crossorigin="anonymous"></script>
<script src="{% static 'network/functions.js' %}"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
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

</head>

<body>
	<input type="hidden" id="mem_id" value=${idLog } name="mem_id">
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
					<a href="#">Hello, ${v.mem_id }</a>
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
					<li><a href="${pageContext.request.contextPath}/memberLogoutServlet">로그아웃</a></li>
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
				</ul>
				<div class="fix_each">
					<img src="${pageContext.request.contextPath}/image/006-star.svg"
						class="fix_menu_icon"> <label for="membership"
						class="fix_each_menu">이용권구매</label>
				</div>
			</div>
		</div>
		<div class="fix_btn">
			<c:if test="${not empty scm }">
				<c:forEach items="${scm }" var="v" varStatus="s" end="0">
					<input type="hidden" name="mu_no" value=${v.mu_no }>
					<input type="hidden" id="mem_id" name="mem_id" value=${v.mem_id }>
					<button class="fix_player_btn"
						onclick="window.open('<%=request.getContextPath()%>/playerCtrl.do?mu_no=${v.mu_no}','','width=1200,height=720')">Player</button>
				</c:forEach>
			</c:if>
		</div>
		<div class="modal" tabindex="-1" role="dialog" id="sendReport">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">신고 작성</h5>

					</div>
					<div class="modal-body">
						<p>신고사유 선택</p>
						<form id="reportform" class="sendReport">
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio1" name="reportReason"
									class="custom-control-input" value="F"> <label
									class="custom-control-label" for="customRadio1"
									style="font-size: 13px; padding-bottom: 6px;">욕설</label>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio2" name="reportReason"
									class="custom-control-input" value="A"> <label
									class="custom-control-label" for="customRadio2"
									style="font-size: 13px; padding-bottom: 6px;">음란물</label>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio3" name="reportReason"
									class="custom-control-input" value="R"> <label
									class="custom-control-label" for="customRadio3"
									style="font-size: 13px; padding-bottom: 6px;">허위사실</label>
							</div>
							<div class="custom-control custom-radio">
								<input type="radio" id="customRadio4" name="reportReason"
									class="custom-control-input" value="E"> <label
									class="custom-control-label" for="customRadio4"
									style="font-size: 13px;">기타</label> <input type="text"
									class="form-control" id="reportContent" name="reportContent"
									placeholder="기타 내용을 입력하세요." style="font-size: 13px;" />
							</div>
							<input type="hidden" id="mem_id_forre" name="mem_id" value="">
							<input type="hidden" id="mu_co_no" name="mu_co_no" value="">
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal" onclick="closeModal('sendReport');"
							id="endReport">Close</button>
						<button type="button" class="btn btn-primary" id="addReport">send
							report</button>
					</div>
				</div>
			</div>
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
	<!-- ////////////////////////////////////////////////////////////////// -->
	<div class="content">
		
		<!-- ////////////////////////////////////////////////////////////////////////////////// -->

		<div class="music_more_related">
			<div class="music_more_related_section" id="ct5">Related Music</div>
			<hr class="up">
			<input type="button" class="more" value="더보기">
			<table class="music_more_related_inner">
				<tr>
					<c:if test="${not empty related}">
						<c:forEach items="${related }" var="v" varStatus="s">
							<td><a href="#"><img src="image/" width="150px"
									height="150px" class="album"></a></td>
						</c:forEach>
					</c:if>
				</tr>
				<tr>
					<c:if test="${not empty related}">
						<c:forEach items="${related }" var="v" varStatus="s">
							<td>
								<div class="album_title">
									<a
										href="<%=request.getContextPath() %>/albumMoreServlet?al_no=${v.al_no }">${v.al_name}</a>
								</div> <a
								href="<%=request.getContextPath() %>/artistMoreServlet?art_no=${v.art_no }">${v.art_name}</a>
							</td>
						</c:forEach>
					</c:if>
				</tr>
			</table>
			<hr class="down">
		</div>

		<!-- ////////////////////////////////////////////////////////////////////////////////// -->

		
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
				<div id="fix_info" class="fix_fc">제작자 : 김경태 김수민 곽은지 김지용 장재혁</div>
			</div>
		</footer>

	</div>
	<script>
		$(".tri_con").click(function() {
			var showTvalue = $(this).next().val();
			var showmemId = $("#mem_id").val();
			console.log(showTvalue);
			console.log(showmemId);

			$.ajax({
				type : "POST",
				url : "mainToPlayListSrv",
				data : {
					mem_id : showmemId,
					mu_no : showTvalue
				},
				success : function(resulttr) {

				}
			});
		});

		$(".tri_con").click(function() {
			var showTvalue = $(this).next().val();
			var showmemId = $("#mem_id").val();
			console.log(showTvalue);
			console.log(showmemId);

			$.ajax({
				type : "POST",
				url : "updateCurrmusicServlet",
				data : {
					mem_id : showmemId,
					mu_no : showTvalue
				},
				success : function(resultcm) {

				}
			});
		});
		// $("#com_like").click(function(){
		// 	var showmemId = $("#mem_id").val();
		// 	var showMuconu = $("#com_like_no").val();
		// 	console.log(showmemId);
		// 	console.log(showMuconu);

		// 	$.ajax({
		// 		type:"POST",
		// 		url: "pressLikeInsertServlet.do",
		// 		data:{
		// 			mem_id:showmemId,
		// 			mu_co_no:showMuconu
		// 		},
		// 		success:function(result){
		// 			console.log("에이작스 성공!");
		// 		}
		// 	});
		// });
		function golikeAdd(mu_co_no) {
			var showmemId = $("#mem_id").val();
			console.log(showmemId);
			console.log(mu_co_no);
			$
					.ajax({
						url : "likeAddAction",
						type : "POST",
						data : {
							mu_co_no : mu_co_no,
							mem_id : showmemId
						},
						success : function(result) {
							$("#" + mu_co_no + "like")
									.attr("src",
											"${pageContext.request.contextPath}/image/likegreen.svg");
							$("#" + mu_co_no + "dislike")
									.attr("src",
											"${pageContext.request.contextPath}/image/001-dislike.svg");
						}
					});
		}

		function godislikeAdd(mu_co_no) {
			var showmemId = $("#mem_id").val();
			console.log(showmemId);
			console.log(mu_co_no);
			$
					.ajax({
						url : "dislikeAddAction",
						type : "POST",
						data : {
							mu_co_no : mu_co_no,
							mem_id : showmemId
						},
						success : function(result) {
							$("#" + mu_co_no + "like")
									.attr("src",
											"${pageContext.request.contextPath}/image/002-like.svg");
							$("#" + mu_co_no + "dislike")
									.attr("src",
											"${pageContext.request.contextPath}/image/dislikegreen.svg");
						}
					});
		}

		function goLikeDislikeCount(mu_co_no1, mu_co_no2) {
			$.ajax({
				url : "likeDisLikeCount",
				data : {
					mu_co_no1 : mu_co_no1,
					mu_co_no2 : mu_co_no2
				},
				dataType : "json",
				success : function(result) {
					console.log("카운트 성공!");
					console.log(mu_co_no1);
					console.log(mu_co_no2);
					$("#likeCnt").html(json.likecnt);
					$("#dislikeCnt").html(json.dislikecnt);
				}
			});
		}

		$(".music_comments_report").click(function() {
			$(".modal").css("display", "block");
		});

		function reportshow(mem_id, mu_co_no) {
			$("#mem_id_forre").attr('value', '' + mem_id + '');
			$("#mu_co_no").val(mu_co_no);
			$('#sendReport').on('shown.bs.modal');
			console.log(mem_id);
			console.log(mu_co_no);
		};

		$(function() {
			$("#addReport").on(
					"click",
					function() {
						// if (!$("input:radio[name='reportReason']:checked").val()) {
						//     swal({
						//         icon: 'warning',
						//         title: '신고사유는 반드시 선택해주세요.',
						//         text: " ",
						//         button: false,
						//         timer: 700
						//     });
						//     return;
						// }
						// if ($("input:radio[id='customRadio4']").is(":checked") == true) {
						//     var reportContent = $("input[name='reportContent']").val();
						//     if (reportContent.trim() == 0 || reportContent.length < 1) {
						//         swal({
						//             icon: 'warning',
						//             title: '내용은 반드시 입력하세요.',
						//             text: " ",
						//             button: false,
						//             timer: 700
						//         });
						//         return;
						//     }
						// } else if ($("input:radio[id='customRadio4']").is(":checked") == false) {
						//     if ($("input[name='reportContent']").val() != "") {
						//         swal({
						//             icon: 'warning',
						//             title: '기타선택시 내용 작성이 가능합니다.',
						//             text: " ",
						//             button: false,
						//             timer: 700
						//         });
						//         return;
						//     }
						// }

						var showmemId = $("#mem_id").val();
						var showMuconuRe = $("#mu_co_no").val();
						var rpreason = $(
								"input:radio[name='reportReason']:checked")
								.val();
						var rptext = $("input[name='reportContent']").val();

						console.log(showmemId);
						console.log(showMuconuRe);
						$.ajax({
							url : "addReport",
							type : "POST",
							data : {
								mem_id : showmemId,
								mu_co_no : showMuconuRe,
								report_reason : rpreason,
								report_content : rptext
							},
							success : function(result) {
								$(".modal").css("display", "none");
								console.log(showmemId);
								console.log(showMuconuRe);
								console.log(rpreason);
								console.log(rptext);
							}
						});
					});

			$("#endReport").click(function() {
				$(".modal").css("display", "none");
			});
		});

		$("#lyrics_btn1").click(function() {
			if ($(this).is(':checked')) {
				$("#lyrics_down").css("top", "1790px");
				$(".music_more_lyrics").css("height", "1800px");
			} else {
				$("#lyrics_down").css("top", "413px");
				$(".music_more_lyrics").css("height", "423px");
			}
		});

		/* $("#lyrics_btn1").checked(function(){
			$("#lyrics_down").css("top", "1963px");
		}); */
	</script>
</body>

</html>