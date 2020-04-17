$(function(){
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

  let fileIndex = [1,2,3,4,5,6,7,8,9];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.hidden-destroy').hide();
  
  $('#image-box').on('change', '.js-file', function(e) {
    
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0]; //ファイル名とインデント０をfileに代入


    if(!file){
      // const deleteTarget = $(`js-file_group[data-index="${targetIndex}"]`);
      // console.log(deleteTarget);
      $(`.js-file_group[data-index=${targetIndex}]`).find(".js-remove").trigger("click");
      return false;
      // const deleteTarget = $(`js-file_group[data-index="${targetIndex}"]`);
      // $(".js-remove").trigger("click");
      // return false;
    }
    
      var blobUrl = window.URL.createObjectURL(file);

    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  
      $('#previews').append(buildImg(targetIndex, blobUrl));
    let limitFileField = $(".js-file_group:last").data("index");
    
    if(limitFileField >= 9 ){
      return false;
    } else {
      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] )
    }
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});

