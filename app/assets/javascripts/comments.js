$(document).on('turbolinks:load', function() {
   renderComments();
   submitComments();
})

function renderComments() {
  var idInfo = document.getElementsByClassName('comments')[0]
  var artworkId = idInfo.id
  var museumId = idInfo.dataset.id
  $.get(`/museums/${museumId}/artworks/${artworkId}.json`, function(artwork) {
    var comments = artwork.user_comments
    comments.forEach(function(comment) {
      $(".comments ul").append("<li>" + comment.comments + "</li>")
    })
  })
}

function submitComments() {
  $("#new_user_comment").on('submit', function(event) {
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        $(".comments ul").append(response)
      }
    })
  })
}
