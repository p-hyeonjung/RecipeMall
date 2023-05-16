function close_div() {
    const clo = document.querySelector(".banner_btn");
    const banner = document.querySelector(".adbanner");
    clo.addEventListener("click", function () {
        banner.style.display = "none";
    })
}

$(".top").click(function () {
    $("html, body").animate({ scrollTop: 0 }, "slow");
    return false;
});

// 이미지 슬라이드
let imageindex;
let autoslider;
imageslide(0);
autoslide(imageindex);
$('.control_btn').click(function () {
    imageindex=$(this).index();
    imageslide(imageindex);
});
let slidersw=false;
$('.stop').click(function(){
    slidersw=!slidersw;
    if (slidersw) {
        $('.stop i').removeClass('fa-pause');
        $('.stop i').addClass('fa-play');
        $('.stop i').attr('title','자동 재생')
        clearInterval(autoslider)
    }else{
        $('.stop i').removeClass('fa-play');
        $('.stop i').addClass('fa-pause');
        $('.stop i').attr('title','자동 재생 멈추기')
        autoslide(imageindex);
    }
})


$('.control_panel').hover(
    function(){
        clearInterval(autoslider)
        },
    function(){
        autoslide(imageindex);
    });


function imageslide(imageindex) {
    $('.slide_img').css('right',-1200).animate({'right': 0},2000);
    $('.slide_img').attr('src','image/recipe_slide_img'+(imageindex+1)+'.jpg');
    $('.control_btn').removeClass('on'); 
    $('.control_btn').eq(imageindex).addClass('on'); 
  
}
function autoslide(imageindex){
    autoslider = setInterval(function(imageindex){
        imageindex=$('.on').index();
        if (imageindex<=3) {
            imageindex++;
            imageslide(imageindex)
        }else if(imageindex==4){
            imageindex=0;
            imageslide(imageindex);
        }
    },3000)
}


// 베스트상품 카테고리 이벤트
let bestButton = $('.btn_product_category_area button');
let index;
let bestcontent_name=['.cate1','.cate2','.cate3','.cate4']
let oldindex=-1;
let old; 
let sw; 
$(bestButton).click(function(){
    index = $(this).index();
    old=index;
    if (index != oldindex) {
        $(bestButton).removeClass('btn_clk');
        $(bestButton[index]).addClass('btn_clk');
        // $('.fun_contentArea').slideUp(1000);
        // $(funcontent_name[index-1]).slideDown(1000);
        // if (index==1|| index==3) {
        //     $(fairy).animate({
        //     top : fairymove_top[index-1],
        //     left : -10
        //     },500,'linear').removeClass('fairychoice_transform')
        // }else{
        //     $(fairy).animate({
        //     top : fairymove_top[index-1],
        //     left : 113,
        //     },500,'linear').addClass('fairychoice_transform')
        // }
        oldindex=index;
        } 
});
$(bestButton).hover(function(){
    index = $(this).index();
    $(bestButton[index]).addClass('btn_clk');
},function(){
    index = $(this).index();
    $(bestButton[index]).removeClass('btn_clk');
    $(bestButton[old]).addClass('btn_clk');
});