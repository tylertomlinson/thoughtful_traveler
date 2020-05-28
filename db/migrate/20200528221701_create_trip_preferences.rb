class CreateTripPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_preferences do |t|
      t.references :trip, foreign_key: true
      t.references :preference, foreign_key: true

      t.timestamps
    end
  end
end
