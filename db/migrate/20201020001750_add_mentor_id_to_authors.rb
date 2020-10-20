class AddMentorIdToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_reference :authors, :mentor, null: true
  end
end
