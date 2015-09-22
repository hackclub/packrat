class CreateFeedbackResponses < ActiveRecord::Migration
  def change
    create_table :feedback_responses do |t|
      t.references :meeting, index: true, foreign_key: true
      t.integer :rating

      t.timestamps null: false
    end
  end
end
