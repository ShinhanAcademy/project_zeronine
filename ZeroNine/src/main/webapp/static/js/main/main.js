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
    let showProducts = 3;
    callRecommendedProduct(recommendedCount, showProducts);

    $(".recommended_list .view_more").on("click", function () {
        recommendedCount = 6;
        showProducts = 4;
        callRecommendedProduct(recommendedCount, showProducts);
        $(this).hide();
        $(".recommended_wrap .recommended_list .recommended_list_inner").addClass("on");
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

    console.log("??fastBoardList??", fastBoardList);
    $(fastBoardList).each(function (idx, item) {
        html += `
			  <li class="swiper-slide fast_item">
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
						D-${dDayCount(item.finishTime)} <span>(${remainDateTime(item.finishTime)}까지)</span>
					</div>
					<div class="left"><span>${item.totalpickCount}</span> 개 남음</div>
				</div>
			</li>`;
    });

    $(".fast_list").html(html);

    if (html.indexOf("swiper-slide") > -1) {
        const fastBoardListSwiper = new Swiper(".fast_list_wrap", {
            direction: "vertical",
            loop: true,
            effect: "slide",
            slidesPerView: 3,
            autoplay: true,
            speed: 500,
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

    console.log("??freeBoardList??", freeBoardList);

    $(freeBoardList).each(function (idx, item) {
        html += `
			<li class="swiper-slide free_item">
				<div class="saving_target">
					<div class="saving_con">
						<div class="tit">${item.title}</div>
						<div class="conBox">${item.boardContent}</div>
					</div>
					<div class="deal_bottom">
						<div class="deadline">D-${dDayCount(item.finishTime)} <span>(${remainDateTime(item.finishTime)}까지)</span></div>
					</div>
				</div>
				<div class="progress_status">
					<div class="pie-chart pie-chart${idx+1}">
						<span class="center">${getPercentage(freeDeliveryAmount, item.sum)}%</span>
					</div>
				</div>
			</li>`;
			draw(getPercentage(freeDeliveryAmount, item.sum), `.pie-chart${idx+1}`, "#F1C21B", "#F9E59E");
    });
	
    $(".free_list").html(html);

    if (html.indexOf("swiper-slide") > -1) {
        const freeBoardListSwiper = new Swiper(".free_list_wrap", {
            direction: "vertical",
            loop: true,
            effect: "slide",
            slidesPerView: 4,
            autoplay: true,
            speed: 500,
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
}

//oneToOneBoardList
function callOneBoardList(oneToOneBoardList) {
	let html = "";
	
    console.log("??oneToOneBoardList??", oneToOneBoardList);
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
			<li class="swiper-slide direct_item">
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
					<div class="deadline">D-${dDayCount(item.finishtime)} <span>(${remainDateTime(item.finishtime)}까지)</span></div>
				</div>
			</li>`;
    });

    $(".direct_list").html(html);

    if (html.indexOf("swiper-slide") > -1) {
        const directBoardListSwiper = new Swiper(".direct_list_wrap", {
            direction: "vertical",
            loop: true,
            effect: "slide",
            slidesPerView: 3,
            autoplay: true,
            speed: 500,
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
						<div class="item">
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
			                    <div class="price">${res[idx].price} 원</div>
			                </div>
			            </div>`;
                });
                $(".product_wrap").html(html);
                /*
                const recommendedProducts = new Swiper(".recommended_list_inner", {
                    // Optional parameters
                    direction: "horizontal",
					slidesPerView: showProducts,
					spaceBetween: 82,
					loop: true,
				    speed: 500,
				    //loopAdditionalSlides: 1,
				    
					scrollbar:{
						el : ".swiper-scrollbar",
				        draggable: true, 
				    },
	
                });
*/
            }
        },
        error: function () {
            alert("recommended products 에러입니다.");
        },
    });
}
