<link href="<%=request.getContextPath()%>/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/firstchoice_g.css"
	rel="stylesheet" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Jelly Music - genre choice</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
                .jname {
                    background-color: transparent;
                    outline: none;
                    border: none;
                }
                
                .gonext {
                    background-color: transparent;
                    outline: none;
                    border: none;
                    border-top: 3px solid rgb(74, 254, 0);
                    font-size: 17px;
                    line-height: 40px;
                }
            </style>
</head>

<body>

	<form method="post"
		action="<%=request.getContextPath()%>/firstGenreInsertServlet.do">
		<header class="fix_header">
			<a href="#" id="img_con"> <img src="image/jelly-beans.svg"
				id="img"></img>
			</a>
			<div id="fclist">
				<div id="jelly_title">
					<h1>Jelly is thinking about you...</h1>
				</div>
				<img src="image/jelly-beans.svg" class="jimg" id="j1"></img> <img
					src="image/jelly-beans.svg" class="jimg" id="j2"></img> <img
					src="image/jelly-beans.svg" class="jimg" id="j3"></img>
					<input type="hidden" name="mem_id" value=${mem_id }>
				<input type="text" class="jname" id="mu_genre_1" name="mu_genre_1" readonly>
				<input type="text" class="jname" id="mu_genre_2" name="mu_genre_2" readonly>
				<input type="text" class="jname" id="mu_genre_3" name="mu_genre_3" readonly>
<!-- 				<span class="jname" id="mu_genre_1" name="mu_genre_1"> </span> <span class="jname" id="mu_genre_2" name="mu_genre_2">
				</span> <span class="jname" id="mu_genre_3" name="mu_genre_3"> </span>  -->
				<input type="submit" value="GO NEXT" class="gonext">
				<a href="<%=request.getContextPath()%>/firstArtistCtrl.do"><div class="goback">GO BACK</div></a>
				<div class="notyet">COLLECT 3 JELLY</div>
			</div>
		</header>
		<div class="firstchoice_title_a">
			<div id="firstchoice_title">좋아하는 장르를 알려주세요</div>
			<div id="firstchoice_sub">누구누구님이 좋아하는 세 장르를 클릭하세요. 그리고 위의 젤리
				아이콘에서 확인하세요!</div>
		</div>
		<div id="fc_content">
			<table id="fctbl">
				<tr>
					<c:if test="${not empty fgt}">
						<c:forEach items="${fgt }" var="vo" varStatus="s">
							<td><input type="checkbox" onclick=CountChecked(this)
								class="ahck" name="achk" id="achk" value="${vo.gn_name }"
								style='zoom: 10;'> <img
								src="/image${vo.f_name }.jpg" class="fc_a"></img></td>
						</c:forEach>
					</c:if>
				</tr>
				<tr>
					<c:if test="${not empty fgm}">
						<c:forEach items="${fgm }" var="vo" varStatus="s">
							<td><input type="checkbox" onclick=CountChecked(this)
								class="ahck" name="achk" id="achk" value="${vo.gn_name }"
								style='zoom: 10;'> <img
								src="/image${vo.f_name }.jpg" class="fc_a"></img></td>
						</c:forEach>
					</c:if>
				</tr>
				<tr>
					<c:if test="${not empty fgb}">
						<c:forEach items="${fgb }" var="vo" varStatus="s">
							<td><input type="checkbox" onclick=CountChecked(this)
								class="ahck" name="achk" id="achk" value="${vo.gn_name }"
								style='zoom: 10;'> <img
								src="/image${vo.f_name }.jpg" class="fc_a"></img></td>
						</c:forEach>
					</c:if>
				</tr>
			</table>
		</div>
	</form>
	<script>
		var maxChecked = 3;
		var totalChecked = 0;
		function CountChecked(field) {
			var value_list = []
			$('input:checkbox[name=achk]:checked').each(function() {
				var checked_value = $(this).val();
				value_list.push(checked_value);
			});
			if (field.checked) {
				totalChecked += 1;
			} else {
				totalChecked -= 1;
			}
			console.log(totalChecked);
			if (totalChecked > maxChecked) {
				alert("최대 3개까지 가능");
				field.checked = false;
				totalChecked -= 1;
			}
			if (totalChecked == 0) {
				$("#j1").css("display", "none");
				$("#j2").css("display", "none");
				$("#j3").css("display", "none");
				$("#mu_genre_1").css("display", "none");
				$("#mu_genre_2").css("display", "none");
				$("#mu_genre_3").css("display", "none");
				$(".notyet").css("display", "block");
				$(".gonext").css("display", "none");
				$(".goback").css("display", "none");
			} else if (totalChecked == 1) {
				$("#j1").css("display", "block");
				$("#j2").css("display", "none");
				$("#j3").css("display", "none");
				$("#mu_genre_1").css("display", "block");
				$("#mu_genre_2").css("display", "none");
				$("#mu_genre_3").css("display", "none");
				$(".notyet").css("display", "block");
				$(".gonext").css("display", "none");
				$(".goback").css("display", "none");
				/* document.getElementById("mu_genre_1").innerHTML = value_list[0]; */
				$("#mu_genre_1").val(value_list[0]);
				console.log($("#mu_genre_1").val());
			} else if (totalChecked == 2) {
				$("#j1").css("display", "block");
				$("#j2").css("display", "block");
				$("#j3").css("display", "none");
				$("#mu_genre_1").css("display", "block");
				$("#mu_genre_2").css("display", "block");
				$("#mu_genre_3").css("display", "none");
				$(".notyet").css("display", "block");
				$(".gonext").css("display", "none");
				$(".goback").css("display", "none");
				/* document.getElementById("mu_genre_1").innerHTML = value_list[0];
				document.getElementById("mu_genre_2").innerHTML = value_list[1]; */
				$("#mu_genre_1").val(value_list[0]);
				$("#mu_genre_2").val(value_list[1]);
				console.log($("#mu_genre_2").val());
			} else if (totalChecked == 3) {
				$("#j1").css("display", "block");
				$("#j2").css("display", "block");
				$("#j3").css("display", "block");
				$("#mu_genre_1").css("display", "block");
				$("#mu_genre_2").css("display", "block");
				$("#mu_genre_3").css("display", "block");
				$(".notyet").css("display", "none");
				$(".gonext").css("display", "block");
				$(".goback").css("display", "block");
				/* document.getElementById("mu_genre_1").innerHTML = value_list[0];
				document.getElementById("mu_genre_2").innerHTML = value_list[1];
				document.getElementById("mu_genre_3").innerHTML = value_list[2]; */
				$("#mu_genre_1").val(value_list[0]);
				$("#mu_genre_2").val(value_list[1]);
				$("#mu_genre_3").val(value_list[2]);
				console.log($("#mu_genre_3").val());

			}
		}

	</script>
</body>

</html>