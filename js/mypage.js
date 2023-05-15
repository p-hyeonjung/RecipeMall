$(function () {
    // 자주하는 질문 accordion
    $('.accordion_title').click(function () {

        function slideDown(target) {
          slideUp();
          $(target).addClass('on').next().slideDown();
          $(target).find('.fa').find('i').removeClass('fa-chevron-up');
          $(target).find('.fa').find('i').addClass('fa-chevron-down');
        }
      
        function slideUp() {
          $('.accordion_title').removeClass('on').next().slideUp();
          $('.fa').find('i').removeClass('fa-chevron-down');
          $('.fa').find('i').addClass('fa-chevron-up');
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
    
    // comment check
    $('#comment_chk_all').click(function () {
        comm_chk=$(this).is(':checked');
        chk_all(comm_chk);
    });
    
    $('.chk').click(function () {
        $('#post_chk_all').prop('checked',false);
        $('#comment_chk_all').prop('checked',false);
    });

    /* ------------- 글/댓글 게시판 메뉴 분류 css 유지 ---------- */
    let item=$('.menu_li');

    item.on('click',function () {
        $(this).addClass('active');
        item.not($(this)).removeClass('active');
    });

    /* ------------- 1:1문의 파일첨부 시 파일 이름 출력 ---------- */
    let file=$('input[name="inq_file"]').files[0];
    alert(file);
    // function name_load(input) {
    //     let file=input.files;
    //     let file_name=$('#file_name');
    //     for(var i=0; i<file.length; i++) {
    //         file_name.textContent=file[i];
    //         console.log(file_name.textContent);
    //     }
    // }
});