class ChangeFieldNameInPhoto < ActiveRecord::Migration[6.1]
  def change
    rename_column :photos, :img_url, :photo_url
    remove_column :photos, :is_public, :boolean
    add_column :photos, :privacy, :string
    add_reference :photos, :user, foreign_key: true
  end

end
