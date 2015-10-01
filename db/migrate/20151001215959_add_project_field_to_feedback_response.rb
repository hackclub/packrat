class AddProjectFieldToFeedbackResponse < ActiveRecord::Migration
  def change
    add_column :feedback_responses, :project_description, :string
  end
end
