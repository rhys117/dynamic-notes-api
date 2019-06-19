class CreateNotesTriggerTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes_trigger_types do |t|
      t.string :name

      t.timestamps
    end

    add_reference :notes_triggers, :notes_trigger_type, index: true
  end
end
