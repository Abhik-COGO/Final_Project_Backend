class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :bio
      t.string :email
      t.string :password_digest
      t.string :profile_url
      t.string :gender
      t.integer :age

      t.timestamps
    end
  end
end