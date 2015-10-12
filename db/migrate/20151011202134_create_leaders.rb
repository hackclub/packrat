class CreateLeaders < ActiveRecord::Migration
  def change
    create_table :leaders do |t|

      t.timestamps null: false
    end
  end
end
