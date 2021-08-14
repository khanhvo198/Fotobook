class PhotosController < ApplicationController
  def index
  end




  def create
    puts params[:photo_url]
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to profile_path(id: current_user.id)
    else
      render "new"
    end
  end


  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to profile_path(id: current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to profile_path(id: current_user.id)
  end

  private

  def photo_params
    params.permit(:title,:description,:privacy,:photo_url)
  end
end