class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.new
    @friendship_2 = User.find(params[:format]).friendships.new

    @friendship.create_friendship(current_user.id, params[:format])
    @friendship.confirmed = true
    @friendship_2.create_friendship(params[:format], current_user.id)

    if @friendship.save && @friendship_2.save
      redirect_to users_path, notice: 'Friend request sent.'
    else
      redirect_to root_path, alert: @friendship.errors.full_messages.join('. ').to_s
    end
  end

  def update
    user = User.find(params[:format])

    if current_user.confirm_friend(user)
      redirect_to user_path(params[:format]), notice: 'Friend request accepted.'
    else
      redirect_to root_path, alert: @friendship.errors.full_messages.join('. ').to_s
    end
  end

  def destroy
    friendship = Friendship.find_by(user_id: params[:format], friend_id: current_user.id)
    friendship_2 = Friendship.find_by(user_id: current_user.id, friend_id: params[:format])
    if friendship.destroy && friendship_2.destroy
      redirect_to root_path, alert: 'Friend request rejected!'
    else
      redirect_to root_path, alert: @friendship.errors.full_messages.join('. ').to_s
    end
  end

  # private
  # def friendship_params
  #   params.require(:friendships).permit(:user_id, :friend_id, :confirmed)
  # end
end
