require 'open-uri'

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :attach_default_avatar, only: :create

  private
  def attach_default_avatar
    file = URI.open('app/assets/images/default_avatar.png')
    if current_user
      unless current_user.avatar.attached?
        current_user.avatar.attach(io: file, filename: 'default.jpg', content_type: 'image/png')
        current_user.save!
      end
    end
  end
end
