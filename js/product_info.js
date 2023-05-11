$(function(){
    $('.product_count_minus').on('click',function(){
        minus();
        $('.option2').html($('.count').val())
    });
    $('.product_count_plus').on('click',function(){
        plus();
        $('.option2').html($('.count').val())
    });
    $('.product_date_select').change(function(){
        option1();
    })
    $('.regular_order').change(function (){
        option3();
    });
});
function minus(){
    let num=parseInt($('.product_count input').val());
    if(num>1){
        $('.product_count input').val(num-1);
    }
}
function plus(){
    let num=parseInt($('.product_count input').val());
    $('.product_count input').val(num+1);
}
function option1(){
    $('.option1').html($('.product_date_select').val());
}
function option3(){
    if($('.regular_order').is(":checked")){
        $('.option3').html("O");
    }else{
        $('.option3').html("X");
    };
}