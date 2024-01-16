$(function () {

	//노드정보를 저장하기 위한 변수
	var data = [];
	
    // 페이지 로딩시 tree구조 화면에 랜더링
    renderTree();

 	// 트리구조를 비동기통신 방식으로 서버에서 받아온 후 설정해주는 함수
	function renderTree() {
 		
 		data = [];
 		
        $.ajax({
            url: "/orderSet/getOrderSetList",
            dataType: "json",
            type: "post",
            beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
            success: function(rst) {
            	
            	console.log("불러온 오더세트VO 리스트 : ", rst);
            	
                $.each(rst, function (idx, chart) {
                	
                	// 트리뷰 한 줄에대한 정보를 tempObj에 저장
                    let tempObj = {
                        id: chart.orderSetCd,
                        parent: chart.orderSetParcd,
                        text: chart.orderSetNm,
                        osty: chart.orderSetType,
                        orderCode: chart.orderSetOrdcd,
                        type: "file"
                    };
                	
                    if (tempObj.orderCode == null){
                    	tempObj.orderCode = "";
                    }
                    
                    // 오더세트 타입이 오더세트 오더파일이면
                    if (tempObj.osty == "OSTY01") {
                        tempObj.type = "folder";
                    }
                    // 오더세트 타입이 상병진단이면
                    if (tempObj.osty == "OSTY02") {
                        tempObj.type = "injury";
                    }
                    // 오더세트 타입이 약처방이면
                    if (tempObj.osty == "OSTY03") {
                        tempObj.type = "medicine";
                    }
                    // 오더세트 타입이 주사면
                    if (tempObj.osty == "OSTY04") {
                        tempObj.type = "injection";
                    }
                    // 오더세트 타입이 검사면
                    if (tempObj.osty == "OSTY05") {
                        tempObj.type = "test";
                    }
                    // 오더세트 타입이 치료면
                    if (tempObj.osty == "OSTY06") {
                        tempObj.type = "treatment";
                    }
                    
                   	// 이렇게 설정된 노드1개의 정보를 위에서 선언한 data배열에 추가
                    data.push(tempObj);
                });
                
                // js트리를 한번 부순 후 생성
                $(".orderset-body").jstree('destroy');
                
                // 위에서 설정된 data를 이용해 트리구조 생성
                $(".orderset-body").jstree({
                    core: {
                        data: data,
                        check_callback: true
                    },
                    plugins : ["search", "types", "checkbox"],
                    types : {
                        'folder' : {
                        	"checkbox" : false,
                            "icon" : "/resources/images/icons/icon-folder.png"
                        },
                        'file' : {
                            "icon" : "/resources/images/icons/icon-file.png",
                        },
                        'injury' : {
                            "icon" : "/resources/images/icons/icon-injury.png",
                        },
                        'medicine' : {
                            "icon" : "/resources/images/icons/icon-medicine.png",
                        },
                        'treatment' : {
                            "icon" : "/resources/images/icons/icon-treatment.png",
                        },
                        'test' : {
                            "icon" : "/resources/images/icons/icon-test.png",
                        },
                        'injection' : {
                        	"icon" : "/resources/images/icons/icon-injection.png",
                        },
                        default: {
                            "icon": "/resources/images/icons/icon-file.png"
                        }
                    }
                });
            },
            error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
        });
    }
 	
 	
 	// 오더세트 추가 버튼 누를 시 모달창 띄우기
	$('#createOrderset').on('click', function () {
        $('#createOrdersetModal').modal('show');
        // 오더세트를 연속으로 추가할 때 이전에 남아있던 배열이 있을 수 있어서 한번 초기화
        data = [];
    });

 	
	// 모달 저장버튼 누를시 
	$(document).on('click', '#btnAddOrderset', function(){
		
		// 만약 오더세트 이름이 입력이 안됐으면 alert를 띄운다
		if($('#ordersetName').val() == ""){
			Swal.fire({
				title: '오더세트 이름을 입력해주세요',
				icon: 'warning',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인',
			})
		}
		
		// 지금 선택된 값이 오더인지 오더세트인지 확인
		// 오더세트면 부모노트를 #로, 오더세트타입을 오더세트묶음으로
		if($('#ordersetType').val() === '오더세트'){
			
			data = {
				'orderSetParcd' : '#',
				'orderSetType' : 'OSTY01',
				'orderSetNm' : $('#ordersetName').val()
			}
		// 오더면 부모노드를 선택된 부모 노드코드로, 오더세트타입을 선택된 값으로
		} else if($('#ordersetType').val() === '오더'){
			
			// 만약 상위오더세트가 없을 때
			if($('#ordersetPar option:selected').data('ordersetcd') == null){
				Swal.fire({
					title: '상위 오더세트가 존재하지 않습니다',
					icon: 'warning',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
				})
			}
			
			// 만약 오더를 안골랐으면
			if(!$('.table-result').length){
				Swal.fire({
					title: '추가할 오더를 선택해주세요',
					icon: 'warning',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
				})
			}
			
			// 오더세트 카테고리, 만약 주사를 선택시 카테고리가 주사로 들어감
			orderSetType = $('#ordersetCategory option:selected').data('type');
			if($('.table-result td').eq(2).text() == '주사'){
				orderSetType = 'OSTY04';
			}
			
			data = {
				// 부모의 orderSetCd값 가져오기
				'orderSetParcd' : $('#ordersetPar option:selected').data('ordersetcd'),
				// 오더분류값(처방인지 뭔지,.)
				'orderSetType' : orderSetType,
				// 설정할 이름
				'orderSetNm' : $('#ordersetName').val(),
				// 오더코드값
				'orderSetOrdcd' : $('.table-result td').eq(0).text()
			}
			
			console.log(data);
		}
		
		$.ajax({
			url: '/orderSet/createOrderSet',
			data: JSON.stringify(data),
			contentType:"application/json;charset=utf-8",
			dataType: 'json',
			type: 'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log("오더세트 create의 rst : ", rst);
				
				// 모달 내용 초기화
				resetOrdersetModal();
				
				// 모달 숨기기
				$("#createOrdersetModal").modal("hide");
				$(".fade").attr('style', 'display: none');
				
				// 오더세트 내용 갱신
				renderTree();
				
				// sweetalert2 띄우기
				Swal.fire({
					title: '오더세트 추가가 완료되었습니다',
					icon: 'success',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
				})
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	});
	// 모달 종료시 모달 내용 초기화
	$(document).on('click', '#btnCancelOrderset', resetOrdersetModal);
 	
	function resetOrdersetModal(){
		
		// 카테고리 선택 다시 활성화
		$("#ordersetCategory").prop("disabled", false);
		
		$('#ordersetType').val('오더세트');
		$('.addOrderset-body').html('');
		$('#ordersetName').val('');
	}
	
 	// 오더세트 추가 모달에서 오더세트 유형 변경 시 실행되는 함수(오더세튼지 오더인지에 따라 받는값이 다름)
	$(document).on('change', '#ordersetType', function(){
    	
		// 오더세트 클릭시
		if($("#ordersetType option:selected").data("type") == 'orderset'){
			$('.addOrderset-body').html("");
		}
		
		// 오더 클릭시
		if($("#ordersetType option:selected").data("type") == 'order'){
			
			// 오더세트묶음 목록을 불러온다음 최상위 노드만 골라서 상위오더세트 목록에 출력
			$.ajax({
				url: '/orderSet/getOrderSetList',
				dataType: 'json',
				type: 'post',
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success: function(rst){
					console.log("불러온 오더세트VO 리스트 : ", rst);
					
					let cont = '';
					cont += '<div class="dduk-row">';
					cont += '<div class="dduk-login-d">';
					cont += '<div class="login-input-label">오더분류</div>';
					cont += '<div role="group">';
					cont += '<span>';
					cont += '<select class="order-select" id="ordersetCategory" name="ordersetCategory">';
					cont += '<option>오더세트 카테고리 선택</option>';
					cont += '<option data-type="OSTY02">상병</option>';
					cont += '<option data-type="OSTY05">검사</option>';
					cont += '<option data-type="OSTY03">처방</option>';
					cont += '<option data-type="OSTY06">치료</option>';
					cont += '</select>';
					cont += '</span>';
					cont += '</div>';
					cont += '</div>';
					cont += '<div class="dduk-login-d">';
					cont += '<div class="login-input-label">상위오더세트</div>';
					cont += '<div role="group">';
					cont += '<span>';
					cont += '<select class="order-select" id="ordersetPar" name="ordersetPar">';
					
					$.each(rst, function(index, orderSetVO){
						// 만약 최상위 노드(오더세트 묶음) 이면
						if(orderSetVO.orderSetParcd == '#'){
							// 트리구조에 오더세트 묶음 이름 추가 및 오더세트코드를 숨겨둠
							cont += '<option data-orderSetCd='+orderSetVO.orderSetCd+'>'+orderSetVO.orderSetNm+'</option>';
						}
					})
					
					cont += '</select>';
					cont += '</span>';
					cont += '</div>';
					cont += '</div>';
					cont += '</div>';
					cont += '<div class="dduk-row">';
					cont += '<div class="dduk-login-d">';
					cont += '<div class="login-input-label">오더검색</div>';
					
					// 검색창 시작
					cont += '<div class="input-search-wrap">';
					cont += '<div id="orderSetSearch" class="input-search">';
					cont += '<input type="text" id="searchOrderset" class="input-search-value" autocomplet="off" />';
					cont += '<img src="/resources/images/icons/arrow.png" class="arrow"/>';
					cont += '</div>';
					cont += '<table class="table-search" border="1">';
					cont += '<tbody class="tbody-search">';
					cont += '</tbody>';
					cont += '</table>';
					cont += '</div>';
					// 검색창 끝
					
					cont += '</div>';
					cont += '</div>';
					
					$('.addOrderset-body').html(cont);
				},
				error: function(xhr, status, error){
					console.log('Error:', xhr, status, error);
				}
			});
		}
    });
 	
 	
 	// 오더세트 추가 검색기능 시작
 	// 검색시 검색 목록을 넣어주기 위한 배열
	var dataList = [];
	// 검색 결과 테이블의 크기 설정을 위한 변수
	let width = [];
 	
 	
 	// 오더세트의 오더 카테고리를 변경하면 selectedIndex를 변경
 	$(document).on('change', '#ordersetCategory', function(){
 		
 		let selected = $("#ordersetCategory option:selected").val();
 		let categoryUrl = "";
 		
 		switch (selected) {
 		case '오더세트 카테고리 선택':
 			categoryUrl = '';
 			width = [];
 			break;
        case '상병':
        	categoryUrl = '/orderSet/getInjuryVOList';
        	width = ['20px', '70px', '130px'];
            break;
        case '검사':
        	categoryUrl = '/orderSet/getTestVOList';
        	width = [];
            break;
        case '처방':
        	categoryUrl = '/orderSet/getMedicineVOList';
        	width = [];
            break;
        case '치료':
        	categoryUrl = '/orderSet/getTreatmentVOList';
        	width = [];
            break;
   		}
 		
 		// 만약 카테고리를 선택하지 않았으면
 		if(categoryUrl == '') {
 			dataList = ['검색어를 선택해주세요'];
 		// 카테고리 선택시
 		} else {
 			// 우선 배열을 초기화
 			dataList = [];
 			// 선택한 카테고리에 따라 검색목록을 갱신
 			$.ajax({
 				url: categoryUrl,
 				dataType: 'json',
 				type: 'post',
 				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(rst){
					console.log('오더세트 추가 에서 오더카테고리에 따른 검색 풀 : ' , rst);
					
					// vo만큼 순회
					$.each(rst, function(index, vo){
						// 한 vo안의 모든 정보들을 담기위한 변수 
						let str = "";
						// vo안의 데이터 만큼 순회
						$.each(vo, function(index, column){
							// 검사일 때 가격은 안담아야됨
							// 처방일 때 약분류, 재고, 제조사, 보험적용여부, 총함량은 안가져와도 됨
							// 치료일 때 가격이랑 보험적용여부는 필요 없음
							if(index != 'testPrice' &&
							   index != 'mediType' && index != 'mediStock' && index != 'mediMaker' && index != 'insuYn' && index != 'mediCont' && index != 'mediPrice' &&
							   index != 'tmPrice' && index != 'insuYn'){
								str += (column + ',');
							}
						});
						
						dataList.push(str);
					});
					
					console.log("갱신된 검색 풀", dataList);
					
					updateResultTable(dataList, width);
				},
				error: function(xhr, status, error){
					console.log('Error:', xhr, status, error);
				}
 			});
 		}
 	});
 	
 	
 	// 오더세트 추가 모달에서 오더세트 검사 함수
 	// 검색창에서 단어를 입력할 때 마다 실행
	$(document).on('keyup', '#searchOrderset', function() {
		let value = $('#searchOrderset').val().trim();
		let matchDataList = dataList.filter((label) => label.includes(value));
		updateResultTable(matchDataList, width);
	});
 	
 	
 	// 검색결과의 배열인 data를 이용해서 테이블로 만들어주는 함수
 	// data에는 검색결과의 배열이 들어오고
 	// width에는 내가 주고       싶은 각각의 td값의 width를 넣으면 된다
 	function updateResultTable(data, width){
 		$('.tbody-search').html('');
 		let cont = "<tr>";
 		
 		// 우선 배열의 길이만큼 실행
 		$.each(data, function(index, str){
 			// ,를 정규식으로 만들어줌
 			let regex = new RegExp(',', 'g');
 			// 배열의 한 요소에서 , 의 개수를 파악 후 그 개수만큼 반복
 			let matches = str.match(regex);
 			let repeat = matches.length;
 			
 			// 배열 안의 구문자(,)의 개수만큼 실행 = td(컬럼)의 개수
 			for(let i = 0; i < repeat; i++){
 				let value = str.split(',')[i];
 				cont += "<td class='option' style='width:"+width[i]+"'>"+value+"</td>"
 			}
 			
 			cont += "</tr>"
 		})
 		
 		$('.tbody-search').append(cont);
 	}
 	
 	
	// 검색결과를 선택 시 검색결과 숨기기/보이기 및 선택한 결과를 반영
	$(document).on('click', '.option', function(){
		toggleTableSearch();
		getDataValue($(this));
	});
	// 화살표 선택 시 검색결과 숨기기/보이기
	$(document).on('click', '.arrow', toggleTableSearch);


	// css를 이용해 검색창 숨기기/보이기
	function toggleTableSearch(){
		
		// 만약 배열의 길이가 0이면(검색 결과가 없으면) 함수를 종료시켜서 미리보기가 안되도록 함
		if(dataList.length === 0){
			return;
		}
		
		let $tableSearch = $('.table-search');
	    $tableSearch.toggleClass('active');
	}


	// 오더 목록에서 검색결과를 input창에 대신 넣어버리기
	function getDataValue(clickedOption) {
		
		// 이제 더이상 카테고리를 바꾸면 안되므로 막아놓음
		$("#ordersetCategory").prop("disabled", true);
		
		let clone = clickedOption.closest('tr').html();
		let cont = '<table class="table-result"><tr>' + clone + '<tr></table>';
		$('#orderSetSearch').html(cont);
		
		let tds = $('.table-result tr td');
		$.each(tds, function(index){
			tds.eq(index).attr('class', 'orderset-search-result-fixed');
		});
		
		// 만약 이름을 아직 안지었다면 이름을 오더세트 이름쪽에 넣어주기
		if($('#ordersetName').val() == ''){
			$('#ordersetName').val($('.table-result tr td').eq(1).text());
		}
	}
 	// 오더세트 추가 검색기능 끝
 	
 	
 	// 선택한 노드를 삭제해주는 함수
 	$('#trashbin').on('click', function() {
 		
 		Swal.fire({
			title: '선택된 오더세트들을 삭제하시겠습니까???',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if (result.isConfirmed) {
				// 현재 선택한 모든 노드들을 가져옴
				const delArr = $(".orderset-body").jstree(true).get_selected(true);
				// 삭제할 노드들의 정보를 담을 배열
                const data = [];
             	// 선택된 각 노드에 대해 순회하며 처리
                delArr.forEach(delNode => {
                    data.push({
                        orderSetCd : delNode.id
                    });
                });
             	
             	console.log('data : ', data);
             	
             	// db에서 제거 후 제거 성공시 성공알림 띄우기 및 새로고침
                $.ajax({
                    url: "/orderSet/deleteOrderSet",
                    contentType: "application/json; UTF-8",
                    dataType: "json",
                    data: JSON.stringify(data),
                    type: "post",
                    beforeSend:function(xhr){
    					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    				},
                    success: function(rst){
                    	
                    	console.log("오더세트 삭제 결과 : ", rst);
                    	
                    	// 삭제완료처리
                    	Swal.fire({
                			title: '오더세트가 성공적으로 삭제되었습니다',
                			icon: 'success',
                			confirmButtonColor: '#0ABAB5',
                			confirmButtonText: '확인',
                		})
                		
                		// 트리뷰 갱신
                		renderTree();
                    }
                });
            };
		});
 	});
 	
 	
 	// 오더세트 검색을 위한 함수
 	// 검색창의 값이 입력될 때 마다 검색
    $("#keyword").on("input", function(event) {
    	// 입력된 값 가져오기
        let keyword = $(this).val();
		// jstree의 내장함수를 이용해 검색결과에 효과를 주는부분
        $(".orderset-body").jstree(true).search(keyword);
    });
 	
 	
 	// 오더세트를 선택 후 추가 버튼을 누르면 
 	$('#checkOrderSet').on('click', function(){
 		
 		// 우선 선택한거 추가할건지 물어봄
 		Swal.fire({
			title: '선택된 오더세트들을 추가하시겠습니까???',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if (result.isConfirmed) {
				// 현재 선택한 모든 노드들을 가져옴
				const selArr = $(".orderset-body").jstree(true).get_selected(true);
				// 삽입할 노드들의 정보를 담을 배열
                const dataList = [];
				
             	// 선택된 각 노드에 대해 순회하며 처리
                selArr.forEach(selNode => {
                	
                	dataList.push({
                    	// 해당 데이터의 p.k인 코드값과 어떤 데이턴지, 이 2개를 가져옴
                        orderCode : selNode.original.orderCode,
                        osty : selNode.original.osty
                    });
                });
             	
             	console.log('본문에 삽입될 노드 정보들 : ', dataList);
             	
             	// 삽입될 각 노드에 대해 반복
             	$.each(dataList, function(index, data){
             		
             		let orderSetDetailUrl = '';
             		
             		// 만약 폴더면? 본문에 삽입 X
             		if(data.osty === 'OSTY01'){
             			return;
             		// 만약 상병이면?
             		} else if(data.osty === 'OSTY02') {
             			orderSetDetailUrl = '/orderSet/getInjuryVODetail';
             		// 만약 약처방 또는 주사면?
             		} else if(data.osty === 'OSTY03' || data.osty === 'OSTY04') {
             			orderSetDetailUrl = '/orderSet/getMedicineVODetail';
             		// 만약 검사면?
             		} else if(data.osty === 'OSTY05') {
             			orderSetDetailUrl = '/orderSet/getTestVODetail';
             		// 만약 치료면?
             		} else if(data.osty === 'OSTY06') {
             			orderSetDetailUrl = '/orderSet/getTreatmentVODetail';
              		}
             		
             		// db에서 해당 정보에 대해 자세한 정보를 가져옴
                    $.ajax({
                        url: orderSetDetailUrl,
                        dataType: "json",
                        data: {'orderCode' : data.orderCode},
                        type: "post",
                        beforeSend:function(xhr){
        					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        				},
                        success: function(rst){
                        	console.log("본문에 추가할 오더세트의 오더 정보 상세 : ", rst);
                        	
                        	// 이제 각 유형에 따라 아래에 적당한 테이블을 추가시켜주면 됨
                        	// 만약 상병이면?
                 			if(data.osty === 'OSTY02') {
                 			
                 				// 몇번째 병 진단인지 체크(radio속성을 위해)
                 				index = $('.major').length + 1;
	                 			
	                 			let injuryCd = $('.table-order-result td').eq(0).text();
                 				let injuryNm = $('.table-order-result td').eq(1).text();
                 				let injuryEnm = $('.table-order-result td').eq(2).text();
                 			
                 				let cont = `
                 					<tr class="tr-padding tr-data">
                 						<td class="td-padding-data gray-text">\${rst.ijCd}</td>
                 						<td class="td-padding-data gray-text" style="padding-top:1%">
                 							<label for="major">주</label>
                 							<input type="radio" name="injuryType\${index}" class="major" value="major " />
                 							<label for="minor">부</label>
                 							<input type="radio" name="injuryType\${index}" class="minor" value="minor " />
                 							<label for="excluded">배제</label>
                 							<input type="radio" name="injuryType\${index}" class="excluded" value="excluded " />
                 						</td>
                 						<td class="td-padding-data gray-text">\${rst.ijNm}</td>
                 						<td class="td-padding-data gray-text">\${rst.ijEnm}</td>
                 						<td class="td-padding-data gray-text">
                 							<button class="dduk-btn-disabled btn-state btn-body" data-bs-toggle="modal" data-bs-target="#BodyCdModal">환부선택</button>
                 						</td>
                 					</tr>`;
                 				
                 				// 만약 기본 메세지가 남아있다면
                 				if($('#defaultInjury').length){
                 					$('#defaultInjury').remove();
                 				}
                 			
                 				$('.injury-list-table').append(cont);
                 			
                 			// 만약 약처방 또는 주사면?
                 			} else if(data.osty === 'OSTY03' || data.osty === 'OSTY04') {
                 			
                 				let cont = `
                 					<tr class="tr-padding tr-data">
                 						<td class="td-padding-data gray-text" style="padding: 1%">\${rst.mediCd}</td>
                 						<td class="td-padding-data gray-text">\${rst.mediNm}</td>
                 						<td class="td-padding-data gray-text">\${rst.mediDetail}</td>`;
                 					
                 					// 1. 약품상세에 '연고' 라는 이름이 들어갈 때 -> 용법(투여주기 일 투여횟수 회) 처방량(-일분)
                 					if(rst.mediDetail.indexOf('연고') !== -1){
                 						cont += `	
                 							<td class="td-padding-data gray-text">
                 								<input type="text" class="medicine-order-day" />일
                 								<input type="text" class="medicine-order-per" />회	
                 							</td>
                 							<td class="td-padding-data gray-text">
                 								<input type="text" class="medicine-order-qt" />개
                 							</td>
                 						</tr>`;
                 					// 2. 약품상세가 주사일 때, 기타 처방 일 때 -> 용법(-) 처방량(-)
                 					} else if(rst.mediDetail === '주사' || rst.mediDetail === '기타 처방'){
                 						cont += `	
                 							<td class="td-padding-data gray-text">-</td>
                 							<td class="td-padding-data gray-text">-</td>
                 						</tr>`;
                 					// 3. 패치형 진통제인 경우 -> 용법(-) 처방량(-개)
                 					} else if(rst.mediDetail === '패치형 진통제'){
                 						cont += `	
                 							<td class="td-padding-data gray-text">-</td>
                 							<td class="td-padding-data gray-text">
                 								<input type="text" class="medicine-order-qt" />개
                 							</td>
                 						</tr>`;
                 					// 4. 기본 -> 용법(투여주기 일 투여횟수 회 투여량 알) 처방량(-일분)
                 					} else {
                 						cont += `	
                 							<td class="td-padding-data gray-text">
                 								<input type="text" class="medicine-order-day" />일
                 								<input type="text" class="medicine-order-per" />회
                 								<input type="text" class="medicine-order-dose" />정
                 							</td>
                 							<td class="td-padding-data gray-text">
                 								<input type="text" class="medicine-order-qt" />일분
                 							</td>
                 						</tr>`;
                 					}
                 					
                 					
                 				// 만약 기본 메세지가 남아있다면
                 				if($('#defaultMedicine').length){
                 					$('#defaultMedicine').remove();
                 				}
                 				$('.medicine-list-table').append(cont);
                 			
                 			// 만약 검사면?
                 			} else if(data.osty === 'OSTY05') {
                 			
                 				let cont = `
                 					<tr class="tr-padding tr-data">
                 						<td class="td-padding-data gray-text" style="padding: 1%">\${rst.testCd}</td>
                 						<td class="td-padding-data gray-text">\${rst.testNm}</td>
                 						<td class="td-padding-data gray-text">검사 미진행</td>
                 						<td class="td-padding-data gray-text"></td>
                 						<td class="td-padding-data gray-text">
                 							<button class="dduk-btn-disabled btn-state btn-body" data-bs-toggle="modal" data-bs-target="#BodyCdModal">환부선택</button>
                 						</td>
                 					</tr>`;
                 				
                 				// 만약 기본 메세지가 남아있다면
                 				if($('#defaultTest').length){
                 					$('#defaultTest').remove();
                 				}
                 			
                 				$('.test-list-table').append(cont);
                 			
                 			// 만약 치료면?
                 			} else if(data.osty === 'OSTY06') {
                  			
                 				let cont = `
                 					<tr class="tr-padding tr-data">
                 						<td class="td-padding-data gray-text" style="padding: 1%">\${rst.tmCd}</td>
                 						<td class="td-padding-data gray-text">\${rst.tmNm}</td>
                 						<td class="td-padding-data gray-text">
                 							<button class="dduk-btn-disabled btn-state btn-body" data-bs-toggle="modal" data-bs-target="#BodyCdModal">환부선택</button>
                 						</td>
                 					</tr>`;
                 					
                 				// 만약 기본 메세지가 남아있다면
                 				if($('#defaultTreatment').length){
                 					$('#defaultTreatment').remove();
                 				}
                 				$('.treatment-list-table').append(cont);
                 				
                 			}
                        }
                    });
             	});
             	
            	// 성공적으로 잘 들어갔으면
            	Swal.fire({
        			title: '선택한 오더들이 성공적으로 반영되었습니다',
        			icon: 'success',
        			confirmButtonColor: '#0ABAB5',
        			confirmButtonText: '확인',
        		})
            };
		});
 	});
});