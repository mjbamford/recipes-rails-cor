class AddDobToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :dob, :datetime
  end
end
