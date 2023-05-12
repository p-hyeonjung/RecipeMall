$(function () {
    // 자주하는 질문 accordion
    $('.accordion_title').on('click', function() {

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
});