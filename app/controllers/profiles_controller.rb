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
    @photos_count = 108
    @albums_count = 109
    @followings_count = 109
    @followers_count = 120 
  end

  def update_info
    if current_user.update(profile_info_params)
      redirect_to profile_path(id: current_user.id)
    else
      render :edit
    end
  end

  def update_password
    @user = current_user
    if @user.update_with_password(profile_password_params)
      bypass_sign_in(@user)
      redirect_to profile_path(id: @user.id)
    else
      render :edit
    end
  end



  def edit
    
  end

  private
  def profile_info_params
    params.permit(:first_name, :last_name, :email)
  end

  def profile_password_params
    params.permit(:current_password, :password, :password_confirmation)
  end
end
