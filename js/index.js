function close_div() {
    const clo = document.querySelector(".banner_btn");
    const banner = document.querySelector(".adbanner");
    clo.addEventListener("click", function () {
        banner.style.display = "none";
    })
}

$(".top").click(function () {
    $("html, body").animate({ scrollTop: 0 }, "slow");
    return false;
});
