class AddSelectedPointToResponse < ActiveRecord::Migration[5.0]
  def up
    add_column :responses, :selected_point, :integer
  end
  
  def down
    remove_column :responses, :selected_point
  end
end
