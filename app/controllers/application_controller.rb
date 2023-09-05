class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_pfp

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :creator])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :creator])
  end

  def set_pfp
    # if user_signed_in?
    #   url = "https://ui-avatars.com/api/?name=#{current_user.first_name}+#{current_user.last_name}"
    #   current_user.profile.attach(
    #     io: url, # TO DO: update file
    #     filename: "#{current_user}.jpg",
    #     content_type: 'image/jpg'
    #   )
    # end
  end
end
