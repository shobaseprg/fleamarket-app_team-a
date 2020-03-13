$(function()  {
  let jqtabs = $(".jq-tab")
    function tabSwitch() {
      jqtabs.removeClass("activeTab");
      $(this).addClass("activeTab");
    const index = jqtabs.index(this);
      $(".jq-box").removeClass("active").eq(index).addClass("active");
      $(".all-show-btn").removeClass("active").eq(index).addClass("active");
    }
  jqtabs.click(tabSwitch);  

   let allshowbtns = $(".jq-all-show-btn")
  function pushAllShowbtn(){
    $('html, body').animate({scrollTop:0},'fast');
    $(".mypageMainContainer__rightContnet__initial").addClass("non-active");
    const index = allshowbtns.index(this);
      $(".all-lists").eq(index).addClass("active");
    } 
    allshowbtns.click(pushAllShowbtn);

  let initialitemtabs = $(".jq-initial-item-tab")
    function itemTabSwitch() {
      initialitemtabs.removeClass("activeTab");
      $(this).addClass("activeTab");
    const index = initialitemtabs.index(this);
      $(".box-content").removeClass("active").eq(index).addClass("active");
    }
    initialitemtabs.click(itemTabSwitch);

});