$(function(){
  // カテゴリーセレクトボックスのオプションを作成（関数定義）
  function appendOption(category){
    let html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成（選択肢の表示）
  function childBox(insertHTML){
    let childBoxHTML =`<div class="sell__main__content__form__box__group__select" id="child_box">
                        <i class="icon-arrow-bottom"></i>
                        <select class="sell__main__content__form__box__group__select__form" id="child_form" name="item[child_id]">
                          <option value="">---</option>
                          ${insertHTML}
                      </select>
                      </div>`
    $("#parent_box").after(childBoxHTML);
    }

  // 孫カテゴリーの表示作成（選択肢の表示）
  function grandChildBox(insertHTML){
    let grandChildBoxHTML =`<div class="sell__main__content__form__box__group__select" id="grandchild_box">
                              <i class="icon-arrow-bottom"></i>
                              <select class="sell__main__content__form__box__group__select__form" id="grandchild_form" name="item[category_id]">
                                <option value="">---</option>
                                ${insertHTML}
                              </select>
                            </div>`
    $("#child_box").after(grandChildBoxHTML);
    }



  // 親カテゴリー選択後のイベント（イベント発火後、子要素のセレクトボックスが出現）
$(function() {
$("#parent_form").on('change', function(){
let parentValue = $(this).val(); //選択された親カテゴリーの名前を取得
if(parentValue != ""){ //親カテゴリーが初期値でないことを確認
$.ajax({
  // リクエストを送信する先のURL
url: "/categories/get_child_category",
 // HTTP通信の種類を記述する
type: "GET",
// サーバに送信する値
data: {
parent_id: parentValue
},
 // サーバから返されるデータの型
dataType: "json"
})

// doneはAjax通信が成功したとき,failはAjax通信が失敗したとき
.done(function(childs){
$("#child_box").remove();
$("#grandchild_box").remove();
let insertHTML = "";
childs.forEach(function(child){
insertHTML += appendOption(child);
});
childBox(insertHTML);
$('#parent_form').css('margin','0');
})
.fail(function(){
alert("カテゴリー取得に失敗しました");
})
} else {
$("#child_box").remove();
$("#grandchild_box").remove();
}
})
})

// $(function() {
// $("#category-select-box_list").on('change', "#child_form", function(){
// let childValue = $("#child_form").val();
// if(childValue != ""){
// $.ajax({
// url: "/categories/get_grandchild_category",
// type: "GET",
// data: {
// child_id: childValue
// },
// dataType: "json"
// })
// .done(function(grandchilds){
// $("#grandchild_box").remove()
// let insertHTML = "";
// grandchilds.forEach(function(grandchild){
// insertHTML += appendOption(grandchild);
// });
// grandChildBox(insertHTML);
// $('#child_form').css('margin','0');
// })
// .fail(function(){
// alert("カテゴリー取得に失敗しました");
// })
// } else {
// $("#grandchild_box").remove()
// }
// })
// })

});
