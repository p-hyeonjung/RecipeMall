// 글쓰기 숨김메뉴 
let btn_write = $(".btn_write");
btn_write.click(function (e) {
   e.stopPropagation(); // 이벤트 전파 중지
   $('.btn_write_sub').toggle(100);
});
$(document).click(function(e){
    if(!btn_write.is(e.target) && btn_write.has(e.target).length === 0){
        if(!$(e.target).closest('.btn_write_sub').length){
            $('.btn_write_sub').hide(100);
        }
    }
});
