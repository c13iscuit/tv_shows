class AddShowIdToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :show_id, :integer, null: false
  end
end
