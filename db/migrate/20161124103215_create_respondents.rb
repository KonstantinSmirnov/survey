class CreateRespondents < ActiveRecord::Migration[5.0]
  def up
    create_table :respondents do |t|
      t.integer :response_id
      t.integer :survey_id
      
      t.timestamps
    end
    add_column :responses, :respondent_id, :integer

  end
  
  def down
    drop_table :respondents
    remove_column :responses, :respondent_id
  end
end
