class DropUserMuseums < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_museums
  end
end
