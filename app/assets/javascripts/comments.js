.$(document).on("turbolinks:load", function() {
  $(".comments ul").text("");
   renderComments();
   submitComments();
})

var current_user = null;

function renderComments() {
  getCurrentUser();
  var artworkId = window.location.href.split("/")[6]
  var museumId = window.location.href.split("/")[4]
  $.get(`/artworks/${artworkId}/user_comments`, function(comments) {
    comments.forEach(function(comment) {
      if (current_user.username === comment.user.username && parseInt(artworkId) === comment.artwork.id) {
        $(".comments ul").append("<li>" + comment.user.username + ": " + comment.comments + "</li>" + `<a href="/artworks/${artworkId}/user_comments/${comment.id}/edit">` + "Edit" + "</a>")
      } else if (parseInt(artworkId) !== comment.artwork.id) {
        $(".comments ul").append("")
      } else if (current_user.username !== comment.user.username && parseInt(artworkId) === comment.artwork.id) {
        $(".comments ul").append("<li>" + comment.user.username + ": " + comment.comments + "</li>")
      }
    })
  })
}


function getCurrentUser() {
  $.get('/current_user', function(user) {
    if (user) {
      current_user = user
    }
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
