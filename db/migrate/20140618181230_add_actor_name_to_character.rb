class AddActorNameToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :actor_name, :string, null: false
  end
end
