$(function () {
    //main visual
    const mainVisualswiper = new Swiper(".visual_slide_wrap", {
        // Optional parameters
        direction: "horizontal",
        loop: true,
        effect: "fade",
        fadeEffect: {
            crossFade: true,
        },
        autoplay: true,
        speed: 300,

        // If we need pagination
        pagination: {
            el: ".swiper-pagination",
        },

        // Navigation arrows
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        a11y: {
            // 웹접근성
            enabled: true,
            prevSlideMessage: "이전 슬라이드",
            nextSlideMessage: "다음 슬라이드",
            slideLabelMessage: "총 {{slidesLength}}장의 슬라이드 중 {{index}}번 슬라이드 입니다.",
        },
    });

    //board click event
    $(".smart_shopping .intro_unit").on("click", function () {
        let dataName = $(this).attr("data-name");
        if (dataName == "fast") {
            location.href = contextPath + "/board/fastboard.do";
        } else if (dataName == "free") {
            location.href = contextPath + "/board/freedeliveryboard.do";
        } else {
            location.href = contextPath + "/board/onetooneboard.do";
        }
    });

    //상품 추천
    let recommendedCount = 3;
    
    callRecommendedProduct(recommendedCount);

    $(".recommended_list .view_more").on("click", function () {
        recommendedCount = 20;
        callRecommendedProduct(recommendedCount);
        $(this).hide();
        $(".recommended_wrap").addClass("on");
    });



	//게시판AJAX
    $.ajax({
        url: contextPath + "/main/boardList.do",
        type: "POST",
        success: function (res) {
            if (res) {
                const {
                    customerId,
                    fastBoardList,
                    freeBoardList,
                    oneToOneBoardList,
                } = res;

                callFastBoardList(fastBoardList);
                callFreeBoardList(freeBoardList);
               	callOneBoardList(oneToOneBoardList);
            }
        },
        error: function () {
            alert("boardList 에러입니다.");
        },
    });

    $(window).scroll(function(){
        let newSct = $(this).scrollTop();
        let showSubVisual = 1800;
        //console.log("newSct",newSct);
        
        //sub_visual wrap scroll event
        if(newSct >= showSubVisual) {
            $(".sub_visual_wrap").addClass("on");
        }
    });

}); //End_Ready

//fastBoardList
function callFastBoardList(fastBoardList) {
    let html = "";

	//fastBoardList.length = 0;
	if(fastBoardList.length == 0) {
		html += `
		<li class="swiper-slide no_list">
			등록된 슝슝 즉배 게시글이 없습니다.
		</li>`;

		$(".fast_list").html(html);

		return;
	}

    //console.log("??fastBoardList??", fastBoardList);
    $(fastBoardList).each(function (idx, item) {
        html += `
			  <li class="swiper-slide fast_item" data-fast="${item.boardId}">
				<div class="deal_top">
					<div class="img_wrap">
						<img src="${item.imagePath}" alt="product image" />
					</div>
					<div>
						<div class="tit">${item.title}</div>
						<p class="brand">${item.brand}</p>
						<p class="name">${item.pName}</p>
					</div>
				</div>
				<div class="deal_bottom">
					<div class="deadline">
						D-${dDayCount(item.finishTime)} <span>&#40;${remainDateTime(item.finishTime)}까지&#41;</span>
					</div>
					<div class="left"><span>${item.totalpickCount}</span> 개 남음</div>
				</div>
			</li>`;
    });

    $(".fast_list").html(html);

    let itemLoopFlag = false;
    let slidePerCnt = 3;

    if(document.querySelectorAll(".fast_item").length > slidePerCnt) {
        itemLoopFlag = true;
    }

    if (html.indexOf("swiper-slide") > -1) {
        const fastBoardListSwiper = new Swiper(".fast_list_wrap", {
            direction: "vertical",
            loop: itemLoopFlag,
            effect: "slide",
            slidesPerView: slidePerCnt,
            autoplay: true,
            speed: 600,
            spaceBetween: 12,
			watchOverflow: true,
        });

        let $fastSlides = document.querySelectorAll(".fast_item");

        for (let i of $fastSlides) {
            i.addEventListener("mouseover", function () {
                fastBoardListSwiper.autoplay.stop();
            });
            i.addEventListener("mouseout", function () {
                fastBoardListSwiper.autoplay.start();
            });
        }
    }

    $(".fast_list [data-fast]").on("click", function(){
    	let boardId = $(this).attr("data-fast");
    	showBoardModal("fastBoard", boardId);
    });

}

//freeBoardList
function callFreeBoardList(freeBoardList) {
    let html = "";
	const freeDeliveryAmount = 50000;
	
	//freeBoardList.length = 0;
	if(freeBoardList.length == 0) {
		html += `
		<li class="swiper-slide no_list">
			등록된 알뜰 무배 게시글이 없습니다.
		</li>`;

		$(".free_list").html(html);

		return;
	}

    //console.log("??freeBoardList??", freeBoardList);

    $(freeBoardList).each(function (idx, item) {
        html += `
			<li class="swiper-slide free_item" data-free="${item.boardId}">
				<div class="saving_target">
					<div class="saving_con">
						<div class="tit">${item.title}</div>
						<div class="conBox">${item.boardContent}</div>
					</div>
					<div class="deal_bottom">
						<div class="deadline">D-${dDayCount(item.finishTime)} <span>&#40;${remainDateTime(item.finishTime)}까지&#41;</span></div>
					</div>
				</div>
				<div class="progress_status">
					<div class="pie-chart pie-chart${idx+1}">
						<span class="center">${getPercentage(freeDeliveryAmount, item.sum)}%</span>
					</div>
				</div>
			</li>`;
			draw(getPercentage(freeDeliveryAmount, item.sum), `.pie-chart${idx+1}`);
    });
	
    $(".free_list").html(html);

    let itemLoopFlag = false;
    let slidePerCnt = 4;

    if(document.querySelectorAll(".free_item").length > slidePerCnt) {
        itemLoopFlag = true;
    }

    if (html.indexOf("swiper-slide") > -1) {
        const freeBoardListSwiper = new Swiper(".free_list_wrap", {
            direction: "vertical",
            loop: itemLoopFlag,
            effect: "slide",
            slidesPerView: slidePerCnt,
            autoplay: true,
            speed: 600,
            spaceBetween: 12,
			watchOverflow: true,
        });

        let $fastSlides = document.querySelectorAll(".free_item");

        for (let i of $fastSlides) {
            i.addEventListener("mouseover", function () {
                freeBoardListSwiper.autoplay.stop();
            });
            i.addEventListener("mouseout", function () {
                freeBoardListSwiper.autoplay.start();
            });
        }
    }

    $(".free_list [data-free]").on("click", function(){
    	let boardId = $(this).attr("data-free");
    	showBoardModal("freeBoard", boardId);
    });

}

//oneToOneBoardList
function callOneBoardList(oneToOneBoardList) {
	let html = "";
	
    //console.log("??oneToOneBoardList??", oneToOneBoardList);
	if(oneToOneBoardList.length == 0) {
		html += `
		<li class="swiper-slide no_list">
			등록된 1:1 직거래 게시글이 없습니다.
		</li>`;

		$(".direct_list").html(html);

		return;
	}

    $(oneToOneBoardList).each(function (idx, item) {
        html += `
			<li class="swiper-slide direct_item" data-one="${item.oBoardId}">
				<div class="deal_top">
					<div class="img_wrap">
						<img src="${item.oBoardImagePath}" alt="product image" />
					</div>
					<div>
						<div class="tit">${item.oTitle}</div>
						<p class="location_info">${item.address}, ${item.addressDetail}</p>
					</div>
				</div>
				<div class="deal_bottom">
					<div class="deadline">D-${dDayCount(item.finishtime)} <span>&#40;${remainDateTime(item.finishtime)}까지&#41;</span></div>
				</div>
			</li>`;
    });

    $(".direct_list").html(html);

    let itemLoopFlag = false;
    let slidePerCnt = 3;

    if(document.querySelectorAll(".direct_item").length > slidePerCnt) {
        itemLoopFlag = true;
    }

    if (html.indexOf("swiper-slide") > -1) {
        const directBoardListSwiper = new Swiper(".direct_list_wrap", {
            direction: "vertical",
            loop: itemLoopFlag,
            effect: "slide",
            slidesPerView: slidePerCnt,
            autoplay: true,
            speed: 600,
            spaceBetween: 12,
			watchOverflow: true,
        });

        let $fastSlides = document.querySelectorAll(".direct_item");

        for (let i of $fastSlides) {
            i.addEventListener("mouseover", function () {
                directBoardListSwiper.autoplay.stop();
            });
            i.addEventListener("mouseout", function () {
                directBoardListSwiper.autoplay.start();
            });
        }
    }
    
    $(".direct_list [data-one]").on("click", function(){
    	let boardId = $(this).attr("data-one");
    	showBoardModal("oneToOneBoard", boardId);
    });
}

function dDayCount(date) {
	const today = new Date();
	const dDay = new Date(dateSet.convertDate(date));
	const timeGap = dDay.getTime() - today.getTime();

	const remainDate = Math.ceil(timeGap/(1000*60*60*24));

	return remainDate;
}

//recommended products
//AJAX
function callRecommendedProduct(recommendedCount, showProducts) {
    $.ajax({
        url: contextPath + "/main/recommendedProducts.do",
        type: "POST",
        data: { count: recommendedCount },
        success: function (res) {
            if (res) {
                let html = "";
                $(res).each(function (idx, item) {
                    // console.log("res", res[idx]);
                    html += `
						<div class="item swiper-slide">
			                <div class="img_wrap">
			                	<a href= "${contextPath}/product/productDetail.do?productId=${res[idx].productId}" >
			                    	<img src="${res[idx].imagePath}" alt="product">
			                	</a>
			                </div>
			                <div class="info">
		                    	<div class="tit">
				                	<a href= "${contextPath}/product/productDetail.do?productId=${res[idx].productId}" >
				                    	${res[idx].pName}
				                    </a>
		                    	</div>
			                    <div class="price">${numberWithDots(res[idx].price)} 원</div>
			                </div>
			            </div>`;
                });
                $(".product_wrap").html(html);

                if(recommendedCount > 3) {
                    const recommendedProducts = new Swiper(".recommended_list_inner", {
                        direction: "horizontal",
                        effect: "slide",
                        slidesPerView : 4,
                        spaceBetween: 82,
                        loop: true,
                        autoplay: true,
                        speed: 500,
                        loopAdditionalSlides : 1,
                    });
                }
            }
        },
        error: function () {
            alert("recommended products 에러입니다.");
        },
    });
}

function showBoardModal(targetName, boardId) {
    let ajaxUrl = null;

    if (targetName == "oneToOneBoard") {
        ajaxUrl = "/board/oneboardDetail.do";
    } else if(targetName == "freeBoard") {
        ajaxUrl = "/board/freeboardDetail.do";
    } else if(targetName == "fastBoard") {
        ajaxUrl = "/board/fastboardDetail.do";
    }

    $.ajax({
        type: "post",
        url: ajaxUrl,
        data: { boardId : boardId},
        success: function (response) {
            $("#modal").html(response);
            $("#detail_modal_wrap").css("display", "flex");
            esc_btn();
        },
        error: function (error) {
            alert("해당 글은 더 이상 존재하지 않습니다.");
        }
    });
}