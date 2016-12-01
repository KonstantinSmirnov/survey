class AddAttachmentToAnswerVariant < ActiveRecord::Migration[5.0]
  def up
    add_attachment :answer_variants, :image
  end

  def down
    remove_attachment :answer_variants, :image
  end
end
