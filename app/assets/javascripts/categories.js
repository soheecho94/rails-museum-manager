class Artwork {
  constructor(title, year, artist, id, museum_id) {
    this.title = title
    this.year = year
    this.artist = artist
    this.id = id
    this.museum_id = museum_id
  }

  render() {
    let li = document.createElement('li')
    console.log(this.museum_id)
    li.innerHTML = `<a href="/museums/${this.museum_id}/artworks/${this.id}">` + `${this.title} | ${this.artist} | ${this.year}` + "</a>"
    return li.innerHTML
  }
}

$(document).ready(function() {
   renderArtworks();
})

function renderArtworks() {
  var id = $(".artwork_list").attr("id")
  $.get(`/categories/${id}/artworks`, function(data) {
    var html = new Artwork(data[0].title, data[0].year, data[0].artist, data[0].id, data[0].museum.id).render()
    $(".artwork_list ul").append(html)
  })
}
