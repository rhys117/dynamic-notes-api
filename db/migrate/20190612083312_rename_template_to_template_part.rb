class RenameTemplateToTemplatePart < ActiveRecord::Migration[5.2]
  def change
    rename_table :notes_templates, :notes_template_parts
    rename_column :notes_lines, :notes_template_id, :notes_template_part_id
  end
end
