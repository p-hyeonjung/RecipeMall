 // 재료영역 삭제기능
 $(function(){
    btn_del();
    let newRIng = $('.r_ing').clone();
 function btn_del(){
    $('.ing_input_area').on('mouseover', function() {
        $(this).find('.btn_del').css('display', 'inline-block');
    }).on('mouseleave', function() {
           $(this).find('.btn_del').css('display', 'none');
    });

    $('.btn_del').click(function() {
        $(this).parents('.ing_input_area').remove();
        $(this).remove();
    });
 }

//재료영역 추가기능
$('.btn_add_s').click(function() {
    let newInputArea = $('<div class="ing_input_area">' +
        '<input type="text" placeholder="예)재료">' +
        '<input type="text" placeholder="예)양">' +
        '<div class="btn_del">'+
        '<button >' +
        '<i class="fa-solid fa-circle-xmark"></i>' +
        '</button>' +
        '</div>'+
        '</div>');
        newInputArea.insertBefore($(this));
    btn_del();
});


$('.r_ing_container .btn_add').on('click',function() {
    let newRIng2=newRIng.clone();
   newRIng2.find('.btn_add_s').click(function() {
        let newInputArea = $('<p class="ing_input_area">' +
            '<input type="text" placeholder="예)재료">' +
            '<input type="text" placeholder="예)양">' +
            '<button class="btn_del">' +
            '<i class="fa-solid fa-circle-xmark"></i>' +
            '</button>' +
            '</p>');
        newInputArea.insertBefore($(this));
        btn_del();
    });

    $('.r_ing_ex_area').before(newRIng2);
    btn_del();
});

//순서영역 추가버튼
$('.r_seq .btn_add').click(function() {
    var stepNumber = $('.seq_content_area h2').length + 1;
    var newStep = '<div class="seq_content_area flex_area_rsb">' +
        '<div class="r_txt"></div>' +
        '<h2>Step' + stepNumber + '</h2>' +
        '<textarea name="" id="" cols="30" rows="10" placeholder="예)소고기는 기름기를 떼어내고 적당한크기로 썰어주세요."></textarea>' +
        '</div>';
    $('.btn_add_area').before(newStep);
});
});