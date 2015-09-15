class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :club
      t.string :name
      t.text :feedback
      t.string :phone_number
      t.string :rating
      t.string :email
      t.text :misc

      t.timestamps null: false
    end
  end
end
