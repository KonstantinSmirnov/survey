class AddRequiredToQuestion < ActiveRecord::Migration[5.0]
  def up
    add_column :questions, :mandatory, :boolean, default: true
  end

  def down
    remove_column :questions, :mandatory
  end
end
