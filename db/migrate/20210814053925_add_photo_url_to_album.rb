class AddPhotoUrlToAlbum < ActiveRecord::Migration[6.1]
  def change
    add_column :albums, :photo_url, :json
  end
end
