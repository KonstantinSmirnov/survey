class Add < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :surveys_view, :integer, default: 0
  end
end
