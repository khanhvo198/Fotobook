class AddUserIdToAlbum < ActiveRecord::Migration[6.1]
  def change
    add_reference :albums, :user, foreign_key: true
    rename_column :albums, :photo_url, :photos_url
    remove_column :albums, :is_public, :boolean
    add_column :albums, :privacy, :string
  end
end
