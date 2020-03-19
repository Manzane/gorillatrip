module ApplicationHelper
  def user_avatar(user, size=40)
    if user.avatar.attached?
      # user.avatar.variant(resize: "#{size}x#{size}!")
      user.avatar.key
    else
      image_url("avatar.png")
    end
  end
end
