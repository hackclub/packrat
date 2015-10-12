class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.belongs_to :club, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
