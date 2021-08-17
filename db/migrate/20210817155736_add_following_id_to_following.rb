class AddFollowingIdToFollowing < ActiveRecord::Migration[6.1]
  def change
    add_column :followings, :following_id, :bigint
    add_column :followers, :follower_id, :bigint
  end
end
