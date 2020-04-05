$(function(){
  let btn = $(".category-btn")
  let category_lists = $(".category-lists")
  let oya = $("#oya")
  let ko = $("#ko")

  btn.hover(
  function(){
  console.log("in");
  $(".category-lists").removeClass("non-show-list").addClass("show-list");
  });

  category_lists.mouseleave(
    function(){
    $(".category-lists").removeClass("show-list").addClass("non-show-list");
    $("#ko").removeClass("show-list").addClass("non-show-list");
    $("#mago").removeClass("show-list").addClass("non-show-list");
    });

    oya.hover(
      function(){
      $("#ko").removeClass("non-show-list").addClass("show-list");
      });

      ko.hover(
        function(){
        $("#mago").removeClass("non-show-list").addClass("show-list");
        });
  

    
  
});
