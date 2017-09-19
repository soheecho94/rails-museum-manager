# location
location = Location.create!(name: "New York, USA")
location_1 = Location.create!(name: "Paris, France")

# museum
museum = Museum.create!(name: "Metropolitan Museum of Art", location_id: location.id, description: "The Metropolitan Museum of Art was founded on April 13, 1870, 'to be located in the City of New York, for the purpose of establishing and maintaining in said city a Museum and library of art, of encouraging and developing the study of the fine arts, and the application of arts to manufacture and practical life, of advancing the general knowledge of kindred subjects, and, to that end, of furnishing popular instruction.'")
museum_1 = Museum.create!(name: "The Louvre", location_id: location_1.id, description: "The Louvre Museum is the world's largest art museum and an historic monument in Paris, France. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement.")

# categories
oil_painting = Category.create!(name: "Oil Painting")
italian_renaissance = Category.create!(name: "Italian Renaissance")

# artwork
artwork = Artwork.create!(title: "Oedipus and the Sphinx", artist: "Gustav Moreau", year: "1864", museum_id: museum.id, description: "Moreau, at mid-career, made his mark with this painting at the Salon of 1864. It represents the Greek hero Oedipus confronting the Sphinx outside Thebes: he must solve her riddle to save his life and those of the besieged Thebans. Remains of victims who failed the test appear at bottom right. Moreau's mythological theme and archaizing style reflect his admiration for Ingres’s 1808 version of the same subject and for the work of the early Renaissance painter Andrea Mantegna. In emulating these exemplars, Moreau diverged from the Realist sensibilities shaping French art in the 1860s.")
artwork_1 = Artwork.create!(title: "Mona Lisa", artist: "Leonardo Da Vinci", year: "1503", museum_id: museum_1.id, description: "is a half-length portrait painting by the Italian Renaissance artist Leonardo da Vinci that has been described as 'the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world.'")

artwork_categories = ArtworkCategory.create!(artwork_id: artwork.id, category_id: oil_painting.id)
artwork_categories_1 = ArtworkCategory.create!(artwork_id: artwork_1.id, category_id: oil_painting.id)
artwork_categories_2 = ArtworkCategory.create!(artwork_id: artwork_1.id, category_id: italian_renaissance.id)
