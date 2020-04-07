$(function(){
  let btn = $(".category-btn")
  let category_downlists = $(".category-downlists")
  let oya = $("#oya")
  let ko = $("#ko")

  btn.hover(
  function(){
  console.log("in");
  $(".category-downlists").removeClass("non-show-list").addClass("show-list");
  });

  category_downlists.mouseleave(
    function(){
    $(".category-downlists").removeClass("show-list").addClass("non-show-list");
    $("#ko").removeClass("show-list").addClass("non-show-list");
    $("#mago").removeClass("show-list").addClass("non-show-list");
    });

    oya.hover(
      function(){
      $("#ko").removeClass("non-show-list").addClass("show-list");
      });

    ko.hover(
      function(){
      $("#mago").removeClass("non-show-list").addClass("show-list");
      });

      function childrenDownBuild(children){
        $("#ko").empty();
        $.each(children,
          function(index,child) {
          let html = 
          // <div class= "category-downlist__in__one" data-id="<%= child.id %>">
          `<div class= "category-downlist__in__one" data-id = ${child.id}>
            <a href= "#">${child.name}</a>
          </div>`

          $("#ko").append(html);
          });
      }



      $(".category-downlist__in__one").mouseover(function () {
        let parentID = $(this).data('id'); //選択されたカテゴリーのカスタム属性data-id（つまり、そのかてごりーのid)を格納
          $.ajax({
              // リクエストを送信する先のURL
              url: "/items/category_children",
              // HTTP通信の種類を記述する
              type: "GET",
              // サーバに送信する
              // parent_idをparamsに格納しておくる。params[:parent_id]
              data: {
                parent_id: parentID
              },
              // サーバから返されるデータの型
              dataType: "json"
            })
            // doneはAjax通信が成功したとき,failはAjax通信が失敗したとき
            .done(function (children) {
              // childrenにはjson形式で帰ってきたデータが格納されている。
              childrenDownBuild(children);

            }).fail(function () {
              alert("カテゴリー取得に失敗しました");
            })
        
        });
    
});
