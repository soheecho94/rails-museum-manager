class Artwork {
  constructor(title, year, artist, id, museum_id) {
    this.title = title
    this.year = year
    this.artist = artist
    this.id = id
    this.museum_id = museum_id
  }

  render() {
    var artworkLi = "<li>" + `<a href="/museums/${this.museum_id}/artworks/${this.id}">` + `${this.title} | ${this.artist} | ${this.year}` + "</a></li>"
    return artworkLi
  }
}

$(document).on('turbolinks:load', function() {
   renderArtworks();
})

function renderArtworks() {
    if (window.location.href.match(/\/categories\/(\d+)$/)) {
      $.get(`${window.location.href}/artworks`, function(data) {
        console.log(data)
        data.forEach(function(artwork) {
          var html = new Artwork(artwork.title, artwork.year, artwork.artist, artwork.id, artwork.museum.id).render()
          $(".artwork_list ul").append(html)
        })
      })
    }
}
