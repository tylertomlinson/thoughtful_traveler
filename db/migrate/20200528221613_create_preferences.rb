class CreatePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :preferences do |t|
      t.integer :event
      t.integer :food

      t.timestamps
    end
  end
end
