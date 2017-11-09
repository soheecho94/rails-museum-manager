class Artwork {
  constructor(title, description) {
    this.title = title
    this.description = description
  }
  render() {
    console.log(this.title)
    return "hello"
  }
}

$(document).ready(function() {
   renderArtworks();
})

function renderArtworks() {
  var id = $(".artwork_list").attr("id")
  $.get(`/categories/${id}/artworks`, function(data) {
    var html = new Artwork(data[0].title, data[0].description).render()
    $(".artwork_list").append(html)
  })
}
