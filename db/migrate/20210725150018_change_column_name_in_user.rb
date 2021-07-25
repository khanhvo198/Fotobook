class ChangeColumnNameInUser < ActiveRecord::Migration[6.1]
  def change
    rename_column :users , :avatar_ur , :avatar_url
  end
end
