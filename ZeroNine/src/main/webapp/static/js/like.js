 $(document).ready(function () {
        $(".like").click(function () {

            var currentImagePath = $(this).find("img.like").attr("src");
            var newImagePath = currentImagePath === "/images/board/heart.png" ?
                "/images/board/red_heart.png" :
                "/images/board/heart.png";

            $(this).find("img.like").attr("src", newImagePath);
        });
    });