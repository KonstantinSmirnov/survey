class CreateResponces < ActiveRecord::Migration[5.0]
  def change
    create_table :responces do |t|
      t.integer :question_id
      t.integer :answer_id
      t.text    :text

      t.timestamps
    end
  end
end
