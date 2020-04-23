$(function(){
  function new_comment(comment_data){
    var html_comment = 
      `
      <div class="comment-Me">
        <div class="comment-content">
          ${comment_data.comment}
          `
    // if (comment_data.user_of_item.id == comment_data.id_of_user_of_comment){
    var html_delete =
          `
          <div class="comment-delete">
            <a rel="nofollow" data-method="delete" href="/comments/${comment_data.id}">削除する</a>
          </div>
        </div>
        `
        // }else{
        //   var html_delete = ``
        // };

    var html_name =`
        <div class="comment-user-name">
          ${comment_data.user_nickname}
        </div>
      </div>`

    var html = html_comment + html_delete + html_name;
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
    console.log(comment_data)
    var html = new_comment(comment_data);
    console.log(html)
    $(".comment-list").append(html)
    $('#comment_body').val("");
    $('.comment-list').animate({ scrollTop: $('.comment-list')[0].scrollHeight});
  })
  .fail(function() {
    alert("メッセージ送信に失敗しました");
  });
});
})