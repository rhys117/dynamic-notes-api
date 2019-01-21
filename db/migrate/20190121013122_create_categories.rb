class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.text :tags, array: true, default: []

      t.timestamps
    end
  end
end
