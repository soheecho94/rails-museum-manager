$(document).on("turbolinks:load", function() {
  store.state.artworkIds = $('#artwork-ids').data("artwork-ids");
  store.state.currentArtworkId = $(".js-next").data("id");
  store.state.currentUser = $('#current-user').data("current-user");
  next();
})

var store = {
  state: {
    artworkIds: [],
    currentArtworkId: undefined,
    artworks: [],
    currentUser: undefined
  }
}

function getNextArtworkId() {
  const { artworkIds, currentArtworkId } = store.state
  var index = artworkIds.findIndex(id => id === currentArtworkId)
  if (index === artworkIds.length - 1) {
    return artworkIds[0]
  }
  return artworkIds[index + 1]
}

function next() {
  $(".js-next").on("click", function(event) {
    event.preventDefault();
    const nextArtworkId = getNextArtworkId()
    const museumId = parseInt($(".js-next").attr("data-museum"));
    $.get("/museums/" + museumId + "/artworks/" + nextArtworkId + ".json", function(artworkData) {
      store.state.currentArtworkId = artworkData.id
      $(".artwork_show h2").text(artworkData.title)
      $(".artwork_show p#artist").html("<strong>ARTIST: </strong>" + artworkData.artist)
      $(".artwork_show p#year").html("<strong>YEAR CREATED: </strong>" + artworkData.year)
      $(".artwork_show p#description").html("<strong>DESCRIPTION: </strong>" + artworkData.description)

      artworkData.categories.forEach(function(category) {
        $(".categories_list").html(`<strong>CATEGORIES: </strong><a href="/categories/${category.id}">${category.name}</a>` + " | ")
      })

      const { currentUser } = store.state
      $(".comments ul").text("")
      artworkData.user_comments.forEach(function(comment) {
        if (currentUser && currentUser.id === comment.user_id && parseInt(nextArtworkId) === comment.artwork_id) {
          $(".comments ul").append("<li>" + comment.username + ": " + comment.comments + "</li>" + `<a href="/artworks/${artworkData.id}/user_comments/${comment.id}/edit">` + "Edit" + "</a>")
        } else if (parseInt(nextArtworkId) !== comment.artwork_id) {
          $(".comments ul").append("")
        } else if (currentUser && currentUser.id !== comment.user_id && parseInt(nextArtworkId) === comment.artwork_id) {
          $(".comments ul").append("<li>" + comment.username + ": " + comment.comments + "</li>")
        }
      })

      $(".button_to").attr('action', `/user_artworks?artwork_id=${artworkData.id}`)
      $(".new_user_comment").attr('action', `/artworks/${artworkData.id}/user_comments`)
    })
  })
}
