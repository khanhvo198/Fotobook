class ProfilesController < ApplicationController

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

  def new_photo

  end



  # private
  # def profile_params
  #   params.require(:profile).permit(:id, :sk)
  # end
end
