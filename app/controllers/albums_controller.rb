class AlbumsController < ApplicationController

    skip_before_action :verify_authenticity_token

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

    def edit
        @album = Album.find(params[:id])
    end

    def update
        @album = Album.find(params[:id])


        @remain_files = params[:remains_file]


        if @remain_files.nil?
            @album.remove_photos_url!
        else
            @remains = @album.photos_url
            @remains_index = @remain_files.map{ |file| @album.photos_url_urls.index(file) }
            @remains.each_with_index do |photo,index| 
                unless @remains_index.include?(index) 
                    @delete_at = @remains.delete_at(index)
                    @delete_at.try(:remove!)
                end
            end
            @album.photos_url = @remains

        end


        @photos_new = params[:photos_url]
        unless @photos_new.nil?
            @album.photos_url += @photos_new
        end

        @album.title = params[:title]
        @album.description = params[:description]
        @album.privacy = params[:privacy]

        if @album.save
            redirect_to profile_path(id: current_user.id)
        else
            render :edit
        end
    end


    def destroy
        
    end


    def album_params
        params.permit({ photos_url: []}, :title, :description, :privacy)
    end



end
