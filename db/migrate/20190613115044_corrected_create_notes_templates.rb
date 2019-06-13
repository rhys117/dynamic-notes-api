class CorrectedCreateNotesTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :notes_templates do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
