//$(document).onすることで常に最新のHTMLの情報を取得することができる。
//turbolinks = Ajaxによるページ遷移の高速化のためのライブラリ
$(function(){
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div class="js-file_group" data-index="${num}">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${num}][image]"
                    id="item_item_images_attributes_${num}_image">
                    <span class="js-remove">削除</span>
                  </div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();
  // changeメソッドは、フォーム要素の内容が変更された時にイベント処理を実行できる
  // changeメソッドは元々のHTML要素に対して有効
  // on('change', '子要素')はjavascriptで変更された後のHTMLにも有効
  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    //shiftメソッドは0番目のインデックスの要素を削除してインデックスの連番の値をシフトし、 削除した値を返します。
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    //push()メソッドは配列の最後に1つ以上の要素を追加し、新しい配列のlengthを返します。
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index')
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});