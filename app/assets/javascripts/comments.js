$(document).ready(function() {
   renderComments();
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
