# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Location
location_1 = Location.create!(name: "Vienna, Austria")

#Museum
museum_1 = Museum.create!(name: "The Leopold Museum", description: "The Leopold Museum, housed in the Museumsquartier in Vienna, Austria, is home to one of the largest collections of modern Austrian art, featuring artists such as Egon Schiele, Gustav Klimt, Oskar Kokoschka and Richard Gerstl.")

museum_1.location = location_2

#Artwork
artwork_2 = Artwork.create!(title: "Self-Portrait", artist: "Egon Schiele", year: 1910 , description: "This work by Egon Schiele is in every respect a unique and personal masterpiece in which the carefully considered composition and the intuitiveness of the painting play equal parts.")

#Category
oil_painting = Category.create!(name: "Oil Painting")
portrait = Category.create!(name: "Portrait")
modern = Category.create!(name: "Modern")
figurative = Category.create!(name: "Figurative Painting")
gouache = Category.create!(name: "Gouache on Paper")

#ArtworkCategory
ArtworkCategory.create!(artwork_id: artwork_2.id, category_id: portrait.id)
ArtworkCategory.create!(artwork_id: artwork_2.id, category_id: figurative.id)
ArtworkCategory.create!(artwork_id: artwork_2.id, category_id: gouache.id)
