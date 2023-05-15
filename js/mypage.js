$(function () {
    // 자주하는 질문 accordion
    $('.accordion_title').click(function () {

        function slideDown(target) {
          slideUp();
          $(target).addClass('on').next().slideDown();
        }
      
        function slideUp() {
          $('.accordion_title').removeClass('on').next().slideUp();
        }
      
        $(this).hasClass('on') ? slideUp() : slideDown(this);
        console.log(event.target.className);
    });
    
    /* ------------------------- mypage post/comment ---------------------------- */
    // 체크박스
    let chk;

    $('#post_chk_all').click(function () {
        chk=$(this).is(':checked');
        chk_all(chk);
    });

    $('.check').click(function () {
        $('#post_chk_all').prop('checked',false);
    });

    function chk_all(chk) {
        if(chk) {
            $('.check').prop('checked',true); 
        } else {    
            $('.check').prop('checked',false); 
        }
    }

});