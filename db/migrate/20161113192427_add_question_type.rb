class AddQuestionType < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :question_type, :integer, default: 0
  end
end
