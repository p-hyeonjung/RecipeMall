$(function(){
    $('.side_cart').on('click',function(){
        slide_cart();
    });
    $('.side_seen').on('click',function(){
        slide_seen();
    });
});


function slide_cart(){
    let hidden_cart=$('.hidden_cart');
    let hidden_seen=$('.hidden_seen');
    hidden_seen.fadeOut();
    if(hidden_cart.is(':hidden')){
        hidden_cart.fadeIn();
        
    }else{
        hidden_cart.fadeOut();
    }
   
};
function slide_seen(){
    let hidden_seen=$('.hidden_seen');
    let hidden_cart=$('.hidden_cart');
    hidden_cart.fadeOut();
    if(hidden_seen.is(':hidden')){
        hidden_seen.fadeIn();
        
    }else{
        hidden_seen.fadeOut();
    }
   
};