class AddQuestionIdsToLine < ActiveRecord::Migration[5.2]
  def change
    add_column :notes_lines, :question_ids, :string, array: true, default: []
  end
end