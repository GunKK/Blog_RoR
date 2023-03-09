class FriendshipsController < ApplicationController 
    
    def create
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])

        if @friendship.save 
            flash[:notice] = "Thêm bạn thành công"
            redirect_to  friend_path(current_user)
        else 
            flash[:notice] = "Thêm bạn thất bại"
            redirect_to  friend_path(current_user)
        end
    end

    def destroy
        @friendship = current_user.friendships.where(:friend_id => params[:friend_id]).first
        @friendship.destroy
        flash[:notice] = "Hủy kết bạn thành công"
        redirect_to  friend_path(current_user)
    end
end