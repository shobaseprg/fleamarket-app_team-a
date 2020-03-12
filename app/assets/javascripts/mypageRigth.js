$(function()  {
  let tabs = $(".tab")
    function tabSwitch() {
      $(".activeTab").removeClass("activeTab");
      $(this).addClass("activeTab");

      const index = tabs.index(this);

      $(".mypageMainContainer__rightContnet__lists").removeClass("activeLists").eq(index).addClass("activeLists");
    console.log("ok")
    }

  tabs.click(tabSwitch);  
});