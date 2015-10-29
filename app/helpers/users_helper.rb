module UsersHelper
  def gravatar_url(user)
    hash = Digest::MD5.hexdigest(user.email)
    "https://www.gravatar.com/avatar/#{hash}"
  end
end
