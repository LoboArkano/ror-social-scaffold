module ApplicationHelper
  def menu_link_to(link_text, link_path, link_class)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path, link_class
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete, class: 'like-link')
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post, class: 'like-link')
    end
  end

  def show_users
    @users.collect do |user|
      concat(content_tag(:li, 'Name: ', user.name))
    end
  end
  #, content_tag(:span, class: "profile-link") + link_to 'See Profile', user_path(user), class: 'profile-link' + show_friend_request(user)

  def show_friend_request(user)
    friend_request = current_user.friend_requests
    if friend_request.include?(user)
      link_to('Accept friend request',  friendships_create_path(user), class: 'profile-link')
    else
      link_to('Add as a friend',  friendships_create_path(user), class: 'profile-link')
    end
  end
end
