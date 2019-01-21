class CreateNotesLineOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :notes_line_orders do |t|
      t.references :notes_question, foreign_key: true
      t.references :notes_line, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
