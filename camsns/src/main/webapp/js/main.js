var index = 0; //글 5개씩 넘기기 위한 변수
	var cntList = "${cntList}";// 총 글 갯수
	var flag = false;//마지막 글 이후 ajax 요청 안하기위한 flag
	var alertFlag =false;//마지막글 alert 창 1번만띄우는 flag
	
	
	$(function() {
		if(cntList ==0){ $("#contentArea").html("글이 존재하지 않습니다.");}
		
		
		/* 검색 */
		$("#searchBox").keydown(function (key) {
			 
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
				//검색 index 초기화
	        	index = 0;
	        	//이전에 감춰뒀던 로딩이미지 보이기
	        	$("#loading").show();
	        	
	        	
		        var word = $(this).val();//검색어 가져옴
		        $("#contentArea").html("");//기존 자료 초기화
		        search(word);//ajax
	        }
	 
	    });


		share();//공유버튼인식
		




	

				
		/* 스크롤시 글 더불러오기 */		
		$(window).scroll(
		
				
				function() {
					share();//버튼인식
					if ($(window).scrollTop() == ($(document).height() - $(window).height()) && flag == true && alertFlag == false) {
						$("#loading").hide();
						alert("마지막 글입니다.");
						alertFlag = true;
						return;
					}

				
					if ($(window).scrollTop() == ($(document).height() - $(window).height())) {
						
						
						if(flag == false){
					
							
						index +=5;
						var word= $("#searchBox").val();
						
							$.ajax({
								type : "GET",
								url : "/camsns/main.action",
								dataType: "json",
								data : "num=" + index + "&word=" + word ,
								
								success: function(result){
									
									if (result.length != 0) {
										$.each(result, function(intValue, currentElement) {
											

												//	console.log(key);
												//console.log(value);
												//categoryType,boardSeq,boardCotent,boardRegdate,boardSubject
												//console.log(currentElement.boardCategoryName);
												//console.log(currentElement.boardCategoryName);
												var html ="";
												
												
												html += '<div class="area">';
												html += '<div class="contentHeader '+currentElement.category+'">';
												html += '<div class="contentNum">#'+currentElement.boardSeq+'</div>';
												html += '<div class="title">'+currentElement.boardSubject+'</div>';
												html += '<div class="shareArea">';
												html += '<button value="'+currentElement.boardSeq+'"'+'name="'+currentElement.boardSeq+'"';
												html += 'class="shareBtn glyphicon glyphicon-share-alt '+currentElement.category+' ">';
												html += '</button>';
												html += '</div>';
												html += '<div class="clear"></div>';
												html += '</div>';
												html += '<div class="content">';
												html += '<div class="contentRegdate">'+currentElement.boardRegdate+' </div>';
												html += '<div class="contentPic">';
												
												
												 $.each(currentElement.fileList, function(key, file) {
													html += '	<img src="./images/board/'+file.fileName+'" /> ';
												
												}); 
												
												html += '</div>';
												html += currentElement.boardContent;
												html += '</div>';
												html += '<div class="comment">';
												html += '<button class="showComment" onclick="location.href=\'/camsns/snsboard/snsboardview.action?boardSeq='+currentElement.boardSeq+'\'">댓글 보기</button>';
												html += '</div>';
												html += '</div>';
												html += '</div>';
												
						
												$("#contentArea").append(html);
											//	console.log($(document).height()); //동적으로 변경된다.
											
												 
											
											

										});
										
									}//if(result!=0)
										
										
										//다음 루프때  alert 띄움
										if((cntList - index ) <= 0){
											flag = true;
											
											
										}
									
								},//sucess
							    error: function(xhr, textStatus, error) {
								        alert('Error' + error);
							    }
							
								
							});//ajax
							
						}
					
					
						
					};
			
					
				});//scroll

	})//onload
	
	function share(){
		/* 카카오톡 글 url 보내기 */
		$(".shareBtn")
				.click(
						function() {
							var name = $(this).attr('name');
							
							var boardSeq = $(this).val();
							var hostUrl = "http://127.0.0.1:8090";
//							var hostUrl = "http://eeu1234.iptime.org:8090";
							var shareUrl = "/camsns/snsboard/snsboardview.action?boardSeq="	+ boardSeq;
							var url = hostUrl +shareUrl
							
							//함수실행
							sendLink(url,name);
							
						})
	}
	
	//검색
	function search(word){
		$.ajax({
			type : "GET",
			url : "/camsns/main.action",
			dataType: "json",
			data : "word=" + word ,
			
			success: function(result){
				
				if (result.length != 0) {
				
					$.each(result, function(intValue, currentElement) {
						
							//console.log(intValue);
							//console.log(currentElement);
							//categoryType,boardSeq,boardCotent,boardRegdate,boardSubject
							//console.log(currentElement.boardCategoryName);
							//console.log(currentElement.boardCategoryName);
							var html ="";
							
							
							html += '<div class="area">';
							html += '<div class="contentHeader '+currentElement.category+'">';
							html += '<div class="contentNum">#'+currentElement.boardSeq+'</div>';
							html += '<div class="title">'+currentElement.boardSubject+'</div>';
							html += '<div class="shareArea">';
							html += '<button value="'+currentElement.boardSeq+'"'+'name="'+currentElement.boardSeq+'"';
							html += 'class="shareBtn glyphicon glyphicon-share-alt '+currentElement.category+' ">';
							html += '</button>';
							html += '</div>';
							html += '<div class="clear"></div>';
							html += '</div>';
							html += '<div class="content">';
							html += '<div class="contentRegdate">'+currentElement.boardRegdate+' </div>';
					

						 
							html += '<div class="contentPic">';
							
							
							 $.each(currentElement.fileList, function(key, file) {
									html += '	<img src="./images/board/'+file.fileName+'" /> ';
								
								}); 
							
							
							
							
							html += '</div>';
						
							
							html += currentElement.boardContent;
							html += '</div>';
							html += '<div class="comment">';
							html += '<button class="showComment" onclick="location.href=\'/camsns/snsboard/snsboardview.action?boardSeq='+currentElement.boardSeq+'\'">댓글 보기</button>';
							html += '</div>';
							html += '</div>';
							html += '</div>';
							
	
							$("#contentArea").append(html);
						

					});
					
				}else{//if(result!=0)
					$("#loading").hide();//값이없을경우
					$("#contentArea").html("결과가 없습니다.");
				}
			},//sucess
		    error: function(xhr, textStatus, error) {
			        alert('Error' + error);
		    }
		
			
		});//ajax
		
	}