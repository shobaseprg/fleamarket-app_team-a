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
    $(".five-lists").addClass("non-active");
    console.log("ok");
    } 
    allshowbtns.click(pushAllShowbtn);
  // ▲通知から一覧を押した場合　うえやま


//   function pushAllShowTbtn(){
//     $("#five-lists").removeClass("active").addClass("non-active");
//     } 
//   $(".t-btn").click(pushAllShowTbtn);
//   // ▲やることから一覧を押した場合　うえやま

//   let itemTabs = $(".itemTab")
//     function itemTabSwitch() {
//       $(".itemTab").removeClass("activeTab");
//       $(this).addClass("activeTab");
//     const index = itemTabs.index(this);
//       $(".itemBox").removeClass("active").eq(index).addClass("active"); 
//     }
//     itemTabs.click(itemTabSwitch);

});