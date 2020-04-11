$(function(){
$(".imageNUMBER").mouseenter(function () {
  $(".itemBox__body__mainIMAGE").empty();
  let src = $(this).data("src");
  let html = 
          `<img class = "item-main-img" src = "${src}">`
          $(".itemBox__body__mainIMAGE").append(html)

});

});