$(function()  {
  let tabs = $(".tab")
    function tabSwitch() {
      $(".tab").removeClass("activeTab");
      $(this).addClass("activeTab");
    const index = tabs.index(this);
      $(".mypageMainContainer__rightContnet__lists").removeClass("active").eq(index).addClass("active");
    }
  tabs.click(tabSwitch);  

  function pushAllShowNbtn(){
    $("#five-lists").removeClass("active").addClass("non-active");
    } 
  $(".n-btn").click(pushAllShowNbtn);
  // ▲通知から一覧を押した場合　うえやま

  function pushAllShowTbtn(){
    $("#five-lists").removeClass("active").addClass("non-active");
    } 
  $(".t-btn").click(pushAllShowTbtn);
  // ▲やることから一覧を押した場合　うえやま

  let itemTabs = $(".itemTab")
    function itemTabSwitch() {
      $(".itemTab").removeClass("activeTab");
      $(this).addClass("activeTab");
    const index = itemTabs.index(this);
      $(".itemBox").removeClass("active").eq(index).addClass("active"); 
    }
    itemTabs.click(itemTabSwitch);

});