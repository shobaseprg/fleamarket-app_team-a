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

  function N_pushAllShow(){
    $(".mypageMainContainer__rightContnet__lists__list__N-allShow").addClass("non-active");
    console.log("ok")
    } 

  $(".mypageMainContainer__rightContnet__lists__list__N-allShow__btn").click(N_pushAllShow);

  function T_pushAllShow(){
    $(".mypageMainContainer__rightContnet__lists__list__T-allShow").addClass("non-active");
    console.log("ok")
    } 

  $(".mypageMainContainer__rightContnet__lists__list__T-allShow__btn").click(T_pushAllShow);


});