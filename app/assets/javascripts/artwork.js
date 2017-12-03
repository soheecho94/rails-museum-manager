$(document).on("turbolinks:load", function() {
  next();
})

function next() {
  $(".js-next").on("click", function(event) {
    event.preventDefault();
    var museumId = parseInt($(".js-next").attr("data-museum"));
    $.get("/museums/" + museumId + "/artworks", function(artworks) {
      var artworkId = parseInt($(".js-next").attr("data-id"));
      var nextArtworkIndex = artworks.findIndex(artwork => artwork.id === artworkId) + 1;
      var nextArtworkData = artworks[nextArtworkIndex]
      var categories = nextArtworkData.categories
      var comments = nextArtworkData.user_comments
      $(".artwork_show h2").text(nextArtworkData.title)
      $(".artwork_show p#artist").html("<strong>ARTIST: </strong>" + nextArtworkData.artist)
      $(".artwork_show p#year").html("<strong>YEAR CREATED: </strong>" + nextArtworkData.year)
      $(".artwork_show p#description").html("<strong>DESCRIPTION: </strong>" + nextArtworkData.description)

      categories.forEach(function(category) {
        $(".categories_list").html(`<strong>CATEGORIES: </strong><a href="/categories/${category.id}">${category.name}</a>` + " | ")
      })

      // getCurrentUser();
      // comments.forEach(function(comment) {
      //   if (current_user && current_user.username === comment.user.username && parseInt(artworkId) === comment.artwork.id) {
      //     $(".comments ul").append("<li>" + comment.user.username + ": " + comment.comments + "</li>" + `<a href="/artworks/${artworkId}/user_comments/${comment.id}/edit">` + "Edit" + "</a>")
      //   } else if (parseInt(artworkId) !== comment.artwork.id) {
      //     $(".comments ul").append("")
      //   } else if (current_user && current_user.username !== comment.user.username && parseInt(artworkId) === comment.artwork.id) {
      //     $(".comments ul").append("<li>" + comment.user.username + ": " + comment.comments + "</li>")
      //   }
      // })

      $(".new_user_comment").attr('action', `/artworks/${nextArtworkData.id}/user_comments`)
    })
  })
}

// function renderCommentsOnNext() {
//   getCurrentUser();
//   var comments = nextArtworkData.user_comments
//     comments.forEach(function(comment) {
//       if (current_user && current_user.username === comment.user.username && parseInt(artworkId) === comment.artwork.id) {
//         $(".comments ul").append("<li>" + comment.user.username + ": " + comment.comments + "</li>" + `<a href="/artworks/${artworkId}/user_comments/${comment.id}/edit">` + "Edit" + "</a>")
//       } else if (parseInt(artworkId) !== comment.artwork.id) {
//         $(".comments ul").append("")
//       } else if (current_user && current_user.username !== comment.user.username && parseInt(artworkId) === comment.artwork.id) {
//         $(".comments ul").append("<li>" + comment.user.username + ": " + comment.comments + "</li>")
//       }
//     })
// }
