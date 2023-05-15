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
    let post_chk;
    let comm_chk;

    function chk_all(chk) {
        if(chk) {
            $('.chk').prop('checked',true); 
        } else {    
            $('.chk').prop('checked',false); 
        }
    }
    // post check
    $('#post_chk_all').click(function () {
        post_chk=$(this).is(':checked');
        chk_all(post_chk);
    });

    $('.chk').click(function () {
        $('#post_chk_all').prop('checked',false);
        $('#comment_chk_all').prop('checked',false);
    });
    // comment check
    $('#comment_chk_all').click(function () {
        comm_chk=$(this).is(':checked');
        chk_all(comm_chk);
    });
    
    /* ------------- 글/댓글 게시판 메뉴 분류 css 유지 ---------- */
    let item=$('.menu_li');

    item.on('click',function () {
        $(this).addClass('active');
        item.not($(this)).removeClass('active');
    });

    function chk_all(chk) {
        if(chk) {
            $('.check').prop('checked',true); 
        } else {    
            $('.check').prop('checked',false); 
        }
    }

});