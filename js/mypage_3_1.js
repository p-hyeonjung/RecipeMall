$(function(){
    $('.btn_product').on('click', function(){
        let reviewId = $(this).data('review-id');
        slide_review(reviewId);
    });
});

function slide_review(reviewId){
    let reviewForm = $(`#review_form_${reviewId}`);
    reviewForm.slideUp();
    let productOpenButton = $(`.btn_product[data-review-id="${reviewId}"]`);
    if(reviewForm.is(':hidden')){
        reviewForm.slideDown();
        productOpenButton.text('줄이기');
    } else {
        reviewForm.slideUp();
        productOpenButton.text('펼쳐보기');
    }
}