class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.new(:user_id => current_user.id, :friend_id => params[:format], :confirmed => false)
    if @friendship.save
      redirect_to user_path(current_user.id)
    else
     redirect_to root_path, alert: params[:id], alert: @friendship.errors.full_messages.join('. ').to_s
    end

  end

  def update
  end

  def destroy
  end
end
