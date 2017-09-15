# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User
user_1 = User.create!(first_name: "First Name", last_name: "Last Name", email: "user@email.com", password: "password1234")

#Location
location_1 = Location.create!(name: "New York, USA")
location_2 = Location.create!(name: "Paris, France")

#Museum
museum_1 = Museum.create!(name: "MoMA", description: "The Museum of Modern Art is an art museum located in Midtown Manhattan in New York City, on 53rd Street between Fifth and Sixth Avenues")
museum_2 = Museum.create!(name: "The Louvre", description: "The Louvre is the world's largest art museum and an historic monument in Paris, France. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement.")

museum_1.location = location_1
museum_2.location = location_2

#UserMuseum
UserMuseum.create!(user_id: user_1.id, museum_id: museum_1.id)
UserMuseum.create!(user_id: user_1.id, museum_id: museum_2.id)

#Artwork
artwork_1 = Artwork.create!(title: "Les Desmoiselles d'Avignon", artist: "Pablo Picasso", year: 1907, description: "Les Demoiselles d'Avignon is a large oil painting created in 1907 by the Spanish artist Pablo Picasso. The work portrays five nude female prostitutes from a brothel on Carrer d'Avinyó in Barcelona.")
artwork_2 = Artwork.create!(title: "Mona Lisa", artist: "Leonardo da Vinci", year: 1503, description: "The Mona Lisa has been described as the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world")

#Category
oil_painting = Category.create!(name: "Oil Painting")
portrait = Category.create!(name: "Portrait")
modern = Category.create!(name: "Modern")
renaissance = Category.create!(name: "Renaissance")

#ArtworkCategory
ArtworkCategory.create!(artwork_id: artwork_1.id, category_id: oil_painting.id)
ArtworkCategory.create!(artwork_id: artwork_1.id, category_id: modern.id)
ArtworkCategory.create!(artwork_id: artwork_1.id, category_id: portrait.id)
ArtworkCategory.create!(artwork_id: artwork_2.id, category_id: oil_painting.id)
ArtworkCategory.create!(artwork_id: artwork_2.id, category_id: portrait.id)
ArtworkCategory.create!(artwork_id: artwork_2.id, category_id: renaissance.id)
