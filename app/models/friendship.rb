class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def create_friendship(user_id, friend_id)
    self.user_id = user_id
    self.friend_id = friend_id
    self.confirmed = false
  end
end
