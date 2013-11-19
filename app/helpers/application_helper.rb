module ApplicationHelper

  def avatar_url(user)
    if user.avatar.present?
      user.avatar.thumb
    else
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png"
    end
  end

end
