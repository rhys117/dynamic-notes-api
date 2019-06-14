class RenameTemplatePartToPart < ActiveRecord::Migration[5.2]
  def change
    rename_table :notes_template_parts, :notes_parts
    rename_column :notes_lines, :notes_template_part_id, :notes_part_id
  end
end
