class FollowsController < ApplicationController


    def create
        @follower = Follower.new(follower_params)
        @follower.user_id = current_user.id


        @following = Following.new()
        @following.user_id = params[:follower_id]
        @following.following_id = current_user.id

        if @following.save && @follower.save
            redirect_to profile_path(id: params[:follower_id])
        end
    end


    def destroy
        @follower = Follower.find_by_follower_id(params[:id])
        @following = Following.find_by_following_id(current_user.id)

        if @follower.destroy && @following.destroy
            redirect_to profile_path(id: current_user.id)
        end
    end


    private

    def follower_params
        params.permit(:follower_id)
    end
        
    
    

    
end
