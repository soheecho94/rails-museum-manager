class Museum {
  constructor(name, id) {
    this.name = name
    this.id = id
  }

  render(){
    var museumLi = "<li>" + `<a href="/museums/${this.id}">` + `${this.name}` + "</a></li>"
    return museumLi
  }
}

$(document).ready(function() {
   renderMuseums();
})

function renderMuseums() {
  $.get('/hello.json', function(data) {
    console.log(data)
    data.forEach(function(museum) {
      var html = new Museum(museum.name, museum.id).render()
      $("#museum_list ul").append(html)
    })
  })
}
