$(function () {
    $('.show_agree').click(function () {
        $(this).next().toggle();
    });

    let index=0;
    $('.payment_type ul li').click(function () {
        index = $(this).index();
        $('.payment_type ul li button').css('background','#fff').css('color','#000');
        $('.payment_type ul li button').eq(index).css('background','rgba(204, 14, 14, 0.79)').css('color','#fff');
    });
    
    $("#point_input").on("input", function() {
        let productPrice = parseFloat($("#product_amount_value").text().replace(",", "").replace("원", ""));
        let pointInput = $(this).val();
        
        if (pointInput === "") {
          $("#payment_amount_value").text(productPrice.toLocaleString() + "원");
        } else {
          let pointUsed = parseFloat(pointInput);
          let paymentPrice = productPrice - pointUsed;
          $("#payment_amount_value").text(paymentPrice.toLocaleString() + "원");
        }
      });

      $("#all_agree").click(function () {
        let checked = $(this).is(':checked');
        if(checked) {
            $('.agree_check').find('input').prop('checked', true);
        } else {
            $('.agree_check').find('input').prop('checked', false);
        }
      });
      
      $(".input_check").click(function () {
        let chk_group = $(".input_check");
        let chk_group_cnt = chk_group.length;
        let checked_cnt = $('.input_check input:checked').length;

        if (checked_cnt <= chk_group_cnt) {
            $('#all_agree').prop('checked', false);
        } else if (checked_cnt == chkGroup_cnt) {
               $('#all_agree').prop('checked', true);
        }
      });

      let payment_index = 0;
      $('.payment_type li').click(function () {
        payment_index = $(this).index();
        $('.payment_method').css('display','none');
        if(payment_index == 0) {
          $('.card_payment').css('display','block');
        }else if(payment_index == 1) {
          $('.transfer_number').css('display','block');
        }
      });
});
