class CreateNotesTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :notes_templates do |t|
      t.string :name

      t.timestamps
    end

    add_column :notes_lines, :notes_template_id, :integer
    add_column :notes_lines, :order, :integer

    add_index :notes_lines, :notes_template_id
  end
end
