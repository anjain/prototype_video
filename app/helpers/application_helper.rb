module ApplicationHelper

  def body_class(body_wrapper = '')
    if body_wrapper.blank?
      'skin-blue sidebar-mini wysihtml5-supported'
    else
      if body_wrapper == "users/sessions"
        "login-page"
      elsif body_wrapper == "users/registrations"
        "register-page"
      else
        body_wrapper
      end
    end
  end

  def user_name_email user
    user.name.present? ? user.name : user.email
  end

end
