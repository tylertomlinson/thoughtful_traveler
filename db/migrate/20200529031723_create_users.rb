class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :password_digest
      t.timestamps
      t.string :email
      t.string :name
      t.string :uid
    end
  end
end
