class CreateNotesPartLines < ActiveRecord::Migration[5.2]
  def change
    create_table :notes_part_lines do |t|
      t.references :notes_part, foreign_key: true
      t.references :notes_line, foreign_key: true
      t.integer :order

      t.timestamps
    end

    remove_column :notes_lines, :notes_part_id
    remove_column :notes_lines, :order
  end
end
