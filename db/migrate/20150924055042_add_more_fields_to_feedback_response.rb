class AddMoreFieldsToFeedbackResponse < ActiveRecord::Migration
  def change
    add_column :feedback_responses, :one_thing_to_improve_on, :text
    add_column :feedback_responses, :one_thing_done_well, :text
    add_column :feedback_responses, :anything_else_to_share, :text
  end
end
