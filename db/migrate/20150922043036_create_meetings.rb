class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.references :club, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
