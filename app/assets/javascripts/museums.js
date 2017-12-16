class Museum {
  constructor(name, id, location_id) {
    this.name = name
    this.id = id
    this.location_id = location_id
  }

  render(){
    var museumLi = "<li>" + `<a href="/museums/${this.id}">` + `${this.name}` + "</a></li>"
    return museumLi
  }
}

$(document).on('turbolinks:load', function() {
   renderMuseums();
   filterMuseums();
})

function renderMuseums() {
  $.get('/hello.json', function(data) {
    data.forEach(function(museum) {
      var html = new Museum(museum.name, museum.id, museum.location_id).render();
      $("#museum_list ul").append(html);
    })
  })
}

function filterMuseums() {
  $(".filter :submit").on('click', function(e) {
    e.preventDefault();
    emptyMuseum();
    var location = parseInt($(".filter option:selected").val());
    if(location){
      $.get('/hello.json', function(data) {
        data.forEach(function(museum) {
          if (museum.location_id === location) {
            var html = new Museum(museum.name, museum.id, museum.location_id).render();
            $("#museum_list ul").append(html);
          }
        })
      })
    } else {
      emptyMuseum();
      renderMuseums();
    }
  })
}

function emptyMuseum() {
  $("#museum_list ul").text("")
}
