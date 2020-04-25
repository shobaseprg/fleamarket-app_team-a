$(function(){
  let cards = $(".card img")

  cards.hover(
  function(){
  $(this).addClass("pickup-card");
  
  },
  function(){
  $(this).removeClass("pickup-card");
  });
});
