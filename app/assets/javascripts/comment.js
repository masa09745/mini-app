$(function(){
  function buildHTML(comment){
    var html = `
                <div class ="comments-list__name">
                <a href=/users/${comment.user_id}>${comment.user_name}</a>
                <div class="comments-list__text">
                  ${comment.text}`
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html)
      $('.comments-new__text').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
});