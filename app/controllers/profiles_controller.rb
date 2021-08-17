class ProfilesController < ApplicationController
  before_action :authenticate_user!


  def index
    case params[:sk]
    when "photos"
      @mode = "photos"
    when "albums" 
      @mode = "albums"
    when "followings"
      @mode = "followings"
    when "followers"
      @mode = "followers"
    else
      @mode = "photos"
    end
    @user = User.find(params[:id])
    @photos_count = @user.photos.size
    @albums_count = @user.albums.size
    @followings_count = @user.followings.size
    @followers_count = @user.followers.size


    @photo_list = @user.photos
    @album_list =@user.albums
    @followings_list = @user.followings.map { |following| User.find(following.following_id)  }

    @followers_list = @user.followers.map{ |follower| User.find(follower.follower_id) }


  end

  def update_info
    @user = current_user
    if @user.update(profile_info_params)
      redirect_to profile_path(id: @user.id)
    else
      render :edit
    end
  end

  def update_password
    @user = current_user
    if @user.update(profile_password_params)
      bypass_sign_in(@user)
      redirect_to profile_path(id: @user.id)
    else
      render :edit
    end
  end



  def edit
    @user = current_user
  end

  private
  def profile_info_params
    params.permit(:first_name, :last_name, :email,:avatar_url)
  end

  def profile_password_params
    params.permit(:password, :password_confirmation)
  end
end
