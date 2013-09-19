module OauthHelper
  def auth_provider(name)
    if name == :twitter
      img = "https://cdn1.iconfinder.com/data/icons/yooicons_set01_socialbookmarks/48/social_twitter_box_blue.png"
    else
      img = "https://cdn3.iconfinder.com/data/icons/free-social-icons/67/github_circle_black-48.png"
    end
      link_to image_tag("#{img}"),
      user_omniauth_authorize_path(name),
      :id => "sign_in_with_#{name}"
  end 
end
