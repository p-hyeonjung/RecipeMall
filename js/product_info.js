$(function(){
    $('.product_count_minus').on('click',function(){
        minus();
    });
    $('.product_count_plus').on('click',function(){
        plus();
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