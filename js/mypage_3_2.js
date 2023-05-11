$(function(){
    $('.product_open').on('click', function(){
        const reviewId = $(this).data('review-id');
        slide_review(reviewId);
    });
});

function slide_review(reviewId){
    const reviewForm = $(`#review_form_${reviewId}`);
    reviewForm.fadeOut();
    if(reviewForm.is(':hidden')){
        reviewForm.fadeIn();
    } else {
        reviewForm.fadeOut();
    }
}