class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :google_place_id
      t.string :name
      t.string :address
      
      t.timestamps
    end
  end
end
