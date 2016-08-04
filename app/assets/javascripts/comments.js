$(document).ready(function(){
$('#new_comment').on('submit', function(ev){
  ev.preventDefault()
  $.post({
    url: ev.target.action,
    data: new FormData(ev.target),
    processData: false,
    contentType: false,
    success: function(data){
    }
  }).success(function(data){
    $('#link-comments').prepend(`<div class="row comment"><div class="row"><p class="top-comment-line col-xs-12">${data.username} || ${data.created_at}</p></div><div class="row"><p class="comment-body col-xs-11 col-xs-offset-1">${data.body}</p></div><div class="row"><p class="col-xs-8 comment-bottom">Edit || Delete</p></div></div>`)



  }
)



})
})
