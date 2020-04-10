$(function(){
$(".imageNUMBER").mouseenter(function () {
  console.log("ok")
  $(".itemBox__body__mainIMAGE").empty();
  let src = $(this).data("src");
  let html = 
          `<img class = "item-main-img" src = "${src}">`
          $(".itemBox__body__mainIMAGE").append(html)

});

});