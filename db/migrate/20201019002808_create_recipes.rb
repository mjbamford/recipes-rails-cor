class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.integer :difficulty
      t.belongs_to :author, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
