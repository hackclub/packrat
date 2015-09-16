class RenameResponsesToFormResponses < ActiveRecord::Migration
  def self.up
    rename_table :responses, :form_responses
  end

  def self.down
    rename_table :form_responses, :responses
  end
end
