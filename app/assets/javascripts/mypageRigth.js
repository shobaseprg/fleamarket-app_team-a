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

  function pushAllShowNbtn(){
    $(".n-allshow").addClass("non-active");
    console.log("ok")
    } 

  $(".n-btn").click(pushAllShowNbtn);

  function pushAllShowTbtn(){
    $(".t-allshow").addClass("non-active");
    console.log("ok")
    } 

  $(".t-btn").click(pushAllShowTbtn);

});