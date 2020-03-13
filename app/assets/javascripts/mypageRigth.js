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
    console.log("ok");
    } 
    allshowbtns.click(pushAllShowbtn);
  // ▲通知から一覧を押した場合　うえやま


//   function pushAllShowTbtn(){
//     $("#five-lists").removeClass("active").addClass("non-active");
//     } 
//   $(".t-btn").click(pushAllShowTbtn);
//   // ▲やることから一覧を押した場合　うえやま

  let initialitemtabs = $(".jq-initial-item-tab")
    function itemTabSwitch() {
      initialitemtabs.removeClass("activeTab");
      $(this).addClass("activeTab");
    const index = initialitemtabs.index(this);
      $(".box-content").removeClass("active").eq(index).addClass("active");
    }
    initialitemtabs.click(itemTabSwitch);

});