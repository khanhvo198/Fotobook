class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @active_sidebar = 'feeds'


    @user_followers = current_user.followers.map { |follower| User.find(follower.follower_id) }

    @photo_list = @user_followers.map do |user|
      user.photos.map do |photo|
        {photo: photo, first_name: user.first_name, last_name: user.last_name, avatar: user.avatar_url}
      end
    end
    @photo_list.flatten!



    @album_list = @user_followers.map do |user|
      user.albums.map do |album|
        {album: album, first_name: user.first_name, last_name: user.last_name, avatar: user.avatar_url}
      end
    end
    @album_list.flatten!
  end




  def discover
    @active_sidebar = 'discover'

    @photo_list = Photo.where('privacy = ? and user_id <> ?', 'Public', current_user.id).map do |photo|
      {photo: photo, user: User.find(photo.user_id)}
    end

    @album_list = Album.where('privacy = ? and user_id <> ?', 'Public', current_user.id).map do |album|
      {album: album, user: User.find(album.user_id)}
    end


  end
end
