$(document).on("turbolinks:load", function() {
  $(function () {
    $(".js-more").on('click', function() {
      var artworkId = $(this).data("id");
      var museumId = $(this).data("museum");
      $.get("/museums/" + museumId + "/artworks/" + artworkId + "/body", function(data) {
        $("#body-" + artworkId).text(data);
      });
    });
  });
})
