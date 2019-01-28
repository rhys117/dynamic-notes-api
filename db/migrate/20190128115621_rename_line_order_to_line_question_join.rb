class RenameLineOrderToLineQuestionJoin < ActiveRecord::Migration[5.2]
  def change
    rename_table :notes_line_orders, :notes_line_questions

    remove_column :notes_lines, :question_ids
  end
end
