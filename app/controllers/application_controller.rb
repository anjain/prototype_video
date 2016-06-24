class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :check_profile_setup, unless: :devise_controller?

  def after_sign_in_path_for(resource)
    user_profile_index_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def check_profile_setup
    if user_signed_in?
      if current_user.user_profile.present?
      else
        redirect_to new_user_profile_path
      end
    end
  end
end
