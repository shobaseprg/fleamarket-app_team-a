$(function()  {
  let tabs = $(".tab")
    function tabSwitch() {
      $(".activeTab").removeClass("activeTab");
      $(this).addClass("activeTab");

      const index = tabs.index(this);

      $(".mypageMainContainer__rightContnet__lists").removeClass("active").eq(index).addClass("active");
    console.log("ok")
    }

  tabs.click(tabSwitch);  

  function pushAllShow(){
    $(".mypageMainContainer__rightContnet__lists__list__allShow").addClass("non-active");
    console.log("ok")
    } 

  $(".mypageMainContainer__rightContnet__lists__list__allShow__btn").click(pushAllShow);

});