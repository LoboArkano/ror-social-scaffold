class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.new(:user_id => current_user.id, :friend_id => params[:format], :confirmed => false)
    if @friendship.save
      redirect_to users_path, notice: "Friend request sent."
    else
      redirect_to root_path, alert: @friendship.errors.full_messages.join('. ').to_s
    end
  end

  def update
    @friendship = Friendship.find_by(user_id: params[:format])
    @friendship.confirmed = true

    if @friendship.save
      redirect_to user_path(params[:format]), notice: "Friend request accepted."
    else
      redirect_to root_path, alert: @friendship.errors.full_messages.join('. ').to_s
    end
  end

  def destroy
  end
end
