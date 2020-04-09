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
          `<div class= "category-downlist__in__one" data-id = ${child.id}>
            <a href= "#">${child.name}</a>
          </div>`

          $("#ko").append(html);
          });
      }

    let parentIDs = [];
    var jqxhr;
      $(".category-downlist__in__one").mouseenter(function () {// マウスが一つ一つのブロックに入ったら発動
        if(jqxhr){          // jqxhrが存在したら、abortで中断する
          jqxhr.abort();
          }
            let parentID = $(this).data('id'); //選択されたカテゴリーのカスタム属性data-id（つまり、そのかてごりーのid)を格納
            parentIDs.push(parentID);// hoverの順番を担保するため、取得順にidをparentIDsに格納
              var nextParentID = parentIDs.shift();
              // shiftメソッドで配列の最初の要素を削除。返り値は、削除した要素なので、nextnextParentIDに格納される。
              jqxhr = $.ajax({ // ajax通信の中身をjqxhrに格納する。
                      // リクエストを送信する先のURL
                      url: "/items/category_children",
                      // HTTP通信の種類を記述する
                      type: "GET",
                      // サーバに送信する
                      data: {// nextParentID(parent_id)をparamsに格納しておくる。params[:parent_id]
                        parent_id: nextParentID
                      },
                      // サーバから返されるデータの型
                      dataType: "json",
              })
                  // doneはAjax通信が成功したとき,failはAjax通信が失敗したとき
                  .done(function (children) {
                    // childrenにはjson形式で帰ってきたデータが格納されている。
                    childrenDownBuild(children);
                  }).fail(function (jqxhr,textStatus) {
                    // abort（中断）した場合、failを処理する仕様なので、alertを出現させせないために、textStatus === 'abort'の
                    // 場合は、何もしない処理をさせる。
                    if (textStatus === 'abort'){return;}
                    alert("カテゴリー取得に失敗しました");
                  })
        });
        
});
