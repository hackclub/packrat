module UsersHelper
  def gravatar_url(user)
    user_url = user.email.nil? ? 'default': Digest::MD5.hexdigest(user.email)

    "https://www.gravatar.com/avatar/#{user_url}"
  end
end
