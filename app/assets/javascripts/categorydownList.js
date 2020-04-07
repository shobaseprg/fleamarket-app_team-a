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


          $(".category-downlist__in__one").hover(function () {
            console.log("ok")
            let parentID = $(this).data('id'); //選択されたカテゴリーのカスタム属性data-id（つまり、そのかてごりーのid)を格納
            if (parentID != "") { //親カテゴリーが初期値でないことを確認
              $.ajax({
                  // リクエストを送信する先のURL
                  url: "/items/category_children",
                  // HTTP通信の種類を記述する
                  type: "GET",
                  // サーバに送信する値
                  data: {
                    parent_id: parentID
                  },
                  // サーバから返されるデータの型
                  dataType: "json"
                })
                // doneはAjax通信が成功したとき,failはAjax通信が失敗したとき
                .done(function (children) {
                  $("#child_box").remove();
                  $("#grandchild_box").remove();
                  let insertHTML = "";
                  children.forEach(function (child) {
                    insertHTML += appendOption(child);
                  });
                  childBox(insertHTML);
                  $('#parent_form').css('margin', '0');
                }).fail(function () {
                  alert("カテゴリー取得に失敗しました");
                })
            } else {
              $("#child_box").remove();
              $("#grandchild_box").remove();
            }
          })

        $(function () {
          $("#category-select-box_list").on('change', "#child_form", function () {
            let childValue = $("#child_form").val();
            if (childValue != "") {
              $.ajax({
                url: "/items/category_grandchildren",
                type: "GET",
                data: {
                  child_id: childValue
                },
                dataType: "json"
              }).done(function (grandchilds) {
                $("#grandchild_box").remove()
                let insertHTML = "";
                grandchilds.forEach(function (grandchild) {
                  insertHTML += appendOption(grandchild);
                });
                grandChildBox(insertHTML);
                $('#child_form').css('margin', '0');
              }).fail(function () {
                alert("カテゴリー取得に失敗しました");
              })
            } else {
              $("#grandchild_box").remove()
            }
          })
        })
});
