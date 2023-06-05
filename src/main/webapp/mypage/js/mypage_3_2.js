$(function(){
    $('.product_open').on('click', function(){
        let reviewId = $(this).data('review-id');
        slide_review(reviewId);
    });
});

function slide_review(reviewId){
    let reviewForm = $(`#review_form_${reviewId}`);
    reviewForm.slideUp();
    if(reviewForm.is(':hidden')){
        reviewForm.slideDown();
    } else {
        reviewForm.slideUp();
    }
}