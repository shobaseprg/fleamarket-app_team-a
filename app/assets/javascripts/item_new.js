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
  let fileIndex = [1,2,3,4,5,6,7,8,9];
  // 既に使われているindexを除外「:lastは最後の要素を取得している」「data()はHTML要素内に付与されたdata属性に対して、取得・設定・変更などが簡単に行えるようになる」
  lastIndex = $('.js-file_group:last').data('index');
  // splice()メソッドは古い要素の削除しながら、新しい要素を追加することで、配列の内容を変更します。
  fileIndex.splice(0, lastIndex);
  // 「hide()」は、特定のHTML要素を非表示にすることが可能です。
  $('.hidden-destroy').hide();
  // changeメソッドは、フォーム要素の内容が変更された時にイベント処理を実行できる
  // changeメソッドは元々のHTML要素に対して有効
  // on('change', '子要素')はjavascriptで変更された後のHTMLにも有効
  $('#image-box').on('change', '.js-file', function(e) {
    // 「parent()」は1つ上の階層である「親要素」を取得することができるメソッド。「data()はHTML要素内に付与されたdata属性に対して、取得・設定・変更などが簡単に行えるようになる」
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する。「e.target」はイベント発生源である要素を取得します。
    const file = e.target.files[0];
    // もしチェックボックスが存在すればチェックを入れる
    // JavaScriptを何も書いてない状態でもwindowオブジェクトは利用する事が出来る。
    // createObjectURL()は、URLのメソッドです。Blob、Fileを参照するための一時的なURLを作成します。
    const blobUrl = window.URL.createObjectURL(file);

    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      // 「setAttribute」は、指定の要素に新しい属性を追加します。または指定の要素に存在する属性の値を変更します。
      img.setAttribute('src', blobUrl);
      console.log(img);
    } else {  // 新規画像追加の処理
      // 「append()」は、対象の要素の末尾にテキストやHTML要素を追加するメソッド
      $('#previews').append(buildImg(targetIndex, blobUrl));
    // $(".js-file_group:last").data("index");で最新のidと最新のindex番号を取得。
    let limitFileField = $(".js-file_group:last").data("index");
    //もしlimitFileFieldが９以上ならreturn falseで、これ以上入力フォームは作らず処理から抜ける。
    if(limitFileField >= 9 ){
      return false;
    } else {
      //else以下は、limitFileFieldが８以下なら入力フォームを生成する処理が続く。
      $('#image-box').append(buildFileField(fileIndex[0]));
      //shiftメソッドは0番目のインデックスの要素を削除してインデックスの連番の値をシフトし、 削除した値を返します。
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      //push()メソッドは配列の最後に1つ以上の要素を追加し、新しい配列のlengthを返します。
      fileIndex.push(fileIndex[fileIndex.length - 1] )
    }
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    // 「parent()」は1つ上の階層である「親要素」を取得することができるメソッド。「data()はHTML要素内に付与されたdata属性に対して、取得・設定・変更などが簡単に行えるようになる」
    const targetIndex = $(this).parent().data('index')
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    // 「prop()」は、主にチェックボックスやラジオボタンの選択値を取得するために使います。
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    // 「parent()」は1つ上の階層である「親要素」を取得することができるメソッド。「remove()」は、対象となる要素や子要素などを削除することができるメソッ
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく// 「append()」は、対象の要素の末尾にテキストやHTML要素を追加するメソッド
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});