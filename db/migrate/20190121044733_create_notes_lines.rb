class CreateNotesLines < ActiveRecord::Migration[5.2]
  def change
    create_table :notes_lines do |t|
      t.string :description

      t.timestamps
    end
  end
end
