class AddStatusToSurvey < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :status, :integer, default: 0
  end
end
