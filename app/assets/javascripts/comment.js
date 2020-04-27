$(function(){

// ===================================
// コメント作成
// ===================================

  function new_comment(comment_data){
    if (comment_data.item_user.id == comment_data.user_id){
      var html = 
      `
      <div class="comment-Me" data-index=${comment_data.id}>
        <div class="comment-content">
          ${comment_data.comment}
          <div class="comment_create_at">
            ${comment_data.created_at}
          </div>
          <div class="comment-delete me-pre-delete" data-index=${comment_data.id}>
            <a rel="nofollow" data-method="patch" href="/comments/${comment_data.id}">削除する</a>
          </div>
        </div>
        <div class="comment-user-name">
          ${comment_data.user_nickname}
          <div class="seller-display">
          出品者
          </div>
        </div>
      </div> 
      `
    }else{
      var html = 
      `<div class="comment-Me" data-index=${comment_data.id}>
        <div class="comment-content">
        ${comment_data.comment}
        <div class="comment_create_at">
          ${comment_data.created_at}
        </div>
        </div>
        <div class="comment-user-name">
        ${comment_data.user_nickname}
        </div>
      </div>`   
          };


    return html;

  }

  $('.new_comment').on('submit', function(e){
    e.preventDefault()
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
  .done(function(comment_data){
    var html = new_comment(comment_data);
    $(".comment-list").append(html)
    $('#comment_body').val("");
    $('.comment-list').animate({ scrollTop: $('.comment-list')[0].scrollHeight});
  })
  .fail(function() {
    alert("メッセージ送信に失敗しました");
  });
});

// ===================================
// 完全削除
// ===================================
  $(".comment-list").on('click','.complete-delete',function(e){
  e.preventDefault()
  var index = $(this).data("index");
  $(`.comment-Me[data-index=${index}]`).remove();
  $(`.comment-Other[data-index=${index}]`).remove();
  });

// ===================================
// 自分のコメントを仮削除
// ===================================
function PLEdelete(index){
    var html = 
    `
    出品者によりこのコメントは削除されました。
    <div class="comment-restore">
    <a href="/comments/${index}/restore">復元する</a>
    </div>
    <div class="comment-delete complete-delete" data-index=${index}">
    <a class="complete-delete" rel="nofollow" data-method="delete" href="/comments/${index}">完全に削除する削除する</a>
    </div>`


 return html;
};

$(".comment-list").on('click',".me-pre-delete",function(e){
  e.preventDefault()
  var index = $(this).data("index");
  var content =  $(`.comment-Me[data-index=${index}]`).find(".comment-content");
  content.empty();
  var html = PLEdelete(index);
  content.append(html);
});

// ===================================
// 他人のコメントを仮削除
// ===================================
function PLEdelete(index){
  var html = 
  `
  出品者によりこのコメントは削除されました。
  <div class="comment-restore">
  <a href="/comments/${index}/restore">復元する</a>
  </div>
  <div class="comment-delete complete-delete" data-index="${index}">
  <a class="complete-delete" rel="nofollow" data-method="delete" href="/comments/${index}">完全に削除する削除する</a>
  </div>`


return html;
};

$(".comment-list").on('click',".other-pre-delete",function(e){
e.preventDefault()
var index = $(this).data("index");
var content =  $(`.comment-Other[data-index=${index}]`).find(".comment-content-other");
content.empty();
var html = PLEdelete(index);
content.append(html);
});

})
