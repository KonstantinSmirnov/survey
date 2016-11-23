class RenameAnswerToAnswerVariants < ActiveRecord::Migration[5.0]
  def up
    rename_column :responces, :answer_id, :answer_variant_id
    rename_table :answers, :answer_variants
  end
  
  def down
    rename_column :responces, :answer_variant_id, :answer_id
    rename_table :answer_variants, :answers
  end
end
