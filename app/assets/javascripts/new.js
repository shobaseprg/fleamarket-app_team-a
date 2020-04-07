//$(document).onすることで常に最新のHTMLの情報を取得することができる。
//turbolinks = Ajaxによるページ遷移の高速化のためのライブラリ
$(function(){
  // 画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div class="js-file_group" data-index="${index}">
                    <input class="js-file_group__js-file" type="file"
                    name="item[item_images_attributes][${index}][image]"
                    id="item_item_images_attributes_${index}_image">
                    <span class="js-remove">削除</span>
                  </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  
  // changeメソッドは、フォーム要素の内容が変更された時にイベント処理を実行できる
  // changeメソッドは元々のHTML要素に対して有効
  // on('change', '子要素')はjavascriptで変更された後のHTMLにも有効
  $('#image-box').on('change', '.js-file_group__js-file', function(e) {
    console.log("OK")
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    //shiftメソッドは0番目のインデックスの要素を削除してインデックスの連番の値をシフトし、 削除した値を返します。
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    //push()メソッドは配列の最後に1つ以上の要素を追加し、新しい配列のlengthを返します。
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file_groupjs-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});

// $(function(){
//   let images = [];
//   const previewHTML = img => {
//     const html =
//       `<div class="preview">
//         <div class="preview__img">
//           <img src="${img}">
//         </div>
//         <div class="preview__delete">
//           <div class="preview__delete--button">
//             <p>削除</p>
//           </div>
//         </div>
//       </div>`;
//     $(".dropbox").prepend(html);
//   };

//   $(".dropbox__img").on("drop", e => {
//     // キャンセル、ストップのメソッド
//     e.preventDefault();
//     e.stopPropagation();
//     // 変数定義
//     let dropImg = e.originalEvent.dataTransfer.files;
//     let previewCount = $(".preview").length;
//     let fileImput = $("#sell-img")[0];
//     // 10枚まで
//     if (dropImg.length == 1) {
//       if (previewCount <= 9) {
//         let img = URL.createObjectURL(dropImg[0]);
//         previewHTML(img);
//         images.push(dropImg[0].name);
//         fileImput.files = dropImg;
//         if (previewCount == 9) {
//           $(".dropbox__img").remove();
//         }
//       }
//     } else {
//       alert("画像がアップロードできません");
//     }
//   });

//   // 削除ボタンを押した時のアクション
//   $(document).on("click", ".preview__delete--button", function() {
//     $(this).closest(".preview").remove();
//   });

//   // それぞれのアクション
//   $(document).on("drop", e => {
//     e.stopPropagation();
//     e.preventDefault();
//   });
//   $(document).on("dragenter", e => {
//     e.stopPropagation();
//     e.preventDefault();
//   });
//   $(document).on("dragover", e => {
//     e.stopPropagation();
//     e.preventDefault();
//   });
// });
