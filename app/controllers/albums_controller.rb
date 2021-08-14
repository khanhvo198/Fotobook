class AlbumsController < ApplicationController



    def create
        @album = Album.new(album_params)
        @album.user_id = current_user.id

        if @album.save
            redirect_to profile_path(id: current_user.id)
        else
            render "new"
        end
    end

    def show

    end


    def album_params
        params.permit({ photos_url: []}, :title, :description)
    end


end
