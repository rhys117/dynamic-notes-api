class CreateNotesQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :notes_questions do |t|
      t.string :name
      t.string :description
      t.string :input
      t.string :selections, array: true, default: []
      t.string :placeholder

      t.timestamps
    end
  end
end
