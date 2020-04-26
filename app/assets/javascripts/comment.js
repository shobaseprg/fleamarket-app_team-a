$(function(){
  function new_comment(comment_data){
    if (comment_data.item_user.id == comment_data.user_id){
      var html = 
      `
      <div class="comment-Me">
        <div class="comment-content">
          ${comment_data.comment}
          <div class="comment_create_at">
            ${comment_data.created_at}
          </div>
          <div class="comment-delete">
            <a rel="nofollow" data-method="patch" href="/comments/${comment_data.id}">削除する</a>
          </div>
        </div>
        <div class="comment-user-name">
          ${comment_data.user_nickname}
        </div>
      </div> 
      `
    }else{
      var html = 
      `<div class="comment-Me">
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
})