$(function() {
    let loginLink = $(".login");
    let modal = $("#modal");
    let modal_area = $(".loginbox");

      loginLink.on("click", function(event) {
        event.preventDefault();
        modal.css("display", "block");
        $("body").css("overflow", "hidden");
      });

    $(document).on("click", function(event) {
      if (!$(event.target).closest(".loginbox").length && !$(event.target).is(loginLink)) {
        modal.css("display", "none");
        $("body").css("overflow", "auto");
      }
  });
  });