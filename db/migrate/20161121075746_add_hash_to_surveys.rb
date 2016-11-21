class AddHashToSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :encrypted_link, :string
  end
end
