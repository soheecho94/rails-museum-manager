class ChangeYearTypeInArtworks < ActiveRecord::Migration[5.1]
  def change
    change_column :artworks, :year, :string
  end
end
