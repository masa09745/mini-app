$(function(){
  function buildHTML(comment){
    var html = `
                <div class = "comment-user">
                  <a href=/users/${comment.user_id}>${comment.user_name}</a>
                </div>
                <div class = "comment-text">
                ${comment.text}
                </div>`
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href + '/comments'
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.form__comment').val('');
      $('.comments_area').prepend(html);
      $('.waves-button-input').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});