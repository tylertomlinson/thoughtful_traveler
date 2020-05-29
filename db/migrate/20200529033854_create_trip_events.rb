class CreateTripEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_events do |t|
      t.references :trip, foreign_key: true
      t.references :event, foreign_key: true
    
      t.timestamps
    end
  end
end
