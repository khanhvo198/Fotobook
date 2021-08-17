class AddUserIdToFollows < ActiveRecord::Migration[6.1]
  def change

    rename_table :following, :followings
    rename_table :follower, :followers

    add_reference :followings, :user, foreign_key: true
    add_reference :followers, :user, foreign_key: true

  
  end

end
