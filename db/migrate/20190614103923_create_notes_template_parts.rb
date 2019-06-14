class CreateNotesTemplateParts < ActiveRecord::Migration[5.2]
  def change
    create_table :notes_template_parts do |t|
      t.references :notes_template, foreign_key: true
      t.references :notes_part, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
