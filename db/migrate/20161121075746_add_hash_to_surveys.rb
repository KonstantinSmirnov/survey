class AddHashToSurveys < ActiveRecord::Migration[5.0]
  def up
    add_column :surveys, :encrypted_link, :string
    Survey.all.each do |survey|
      survey.encrypted_link = SecureRandom.uuid if survey.encrypted_link == nil
      survey.save
    end
  end

  def down
    remove_column :surveys, :encrypted_link
  end
end
