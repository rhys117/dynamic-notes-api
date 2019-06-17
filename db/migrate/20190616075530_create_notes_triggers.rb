class CreateNotesTriggers < ActiveRecord::Migration[5.2]
  def change
    create_table :notes_triggers do |t|
      t.string :name
      t.references :notes_template_part, foreign_key: true
      t.references :notes_line_question, foreign_key: true
      t.references :triggered_notes_template_part, foreign_key: { to_table: :notes_template_parts }, index: true
      t.string :value

      t.timestamps
    end

    add_column :notes_template_parts, :static, :boolean, :default => false
  end
end
