class AddAttachmentToQuestions < ActiveRecord::Migration[5.0]
  def up
    add_attachment :questions, :image
  end
  
  def down
    remove_attachment :questions, :image
  end
end
