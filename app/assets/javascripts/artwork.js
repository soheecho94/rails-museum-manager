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
      $(".artwork_show h2").text(nextArtworkData.title)
      $(".artwork_show p#artist").html("<strong>ARTIST: </strong>" + nextArtworkData.artist)
      $(".artwork_show p#year").html("<strong>YEAR CREATED: </strong>" + nextArtworkData.year)
      $(".artwork_show p#description").html("<strong>DESCRIPTION: </strong>" + nextArtworkData.description)
      $(".comments").html("")
      debugger
      $(".new_user_comment").attr('action', `/artworks/${nextArtworkData.id}/user_comments`)
    })
  })
}
