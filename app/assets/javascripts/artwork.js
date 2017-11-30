$(document).on("turbolinks:load", function() {
  readMore();
  next();
})

function readMore() {
  $(".read-more").on('click', function() {
    var artworkId = $(this).data("id");
    var museumId = $(this).data("museum");
    $.get("/museums/" + museumId + "/artworks/" + artworkId + ".json", function(artwork) {
      $("#body-" + artworkId).text(artwork.description);
    });
  });
}

function next() {
  $(".js-next").on("click", function() {
    var museumId = parseInt($(".js-next").attr("data-museum"));
    $.get("/museums/" + museumId + "/artworks", function(artworks) {
      var artworkId = parseInt($(".js-next").attr("data-id"));
      var nextArtworkIndex = artworks.findIndex(artwork => artwork.id === artworkId) + 1;
      var nextArtworkData = artworks[nextArtworkIndex]
      $("artwork_show h2").text(nextArtworkData.title)
      $("artwork_show p#artist").text(nextArtworkData.artist)
      $("artwork_show p#year").text(nextArtworkData.year)
    })
  })
}



// $(function () {
//   $(".js-next").on("click", function() {
//     var nextId = parseInt($(".js-next").attr("data-id")) + 1;
//     $.get("/posts/" + nextId + ".json", function(data) {
//       $(".authorName").text(data["author"]["name"]);
//       $(".postTitle").text(data["title"]);
//       $(".postBody").text(data["description"]);
//       // re-set the id to current on the link
//       $(".js-next").attr("data-id", data["id"]);
//     });
//   });
// });
