class AddAvatarToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :avatar, :string
  end
end
