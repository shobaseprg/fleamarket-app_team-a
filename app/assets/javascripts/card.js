$(function(){
  let cards = $(".card img")

  cards.hover(
  function(){
  console.log("in");
  $(this).addClass("pickup-card");
  
  },
  function(){
  console.log("out");
  $(this).removeClass("pickup-card");
  });
});
