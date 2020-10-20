class CreateCookbooks < ActiveRecord::Migration[6.0]
  def change
    create_table :cookbooks do |t|
      t.string :title
      t.datetime :published_at
      t.timestamps
    end
  end
end
