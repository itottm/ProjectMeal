class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  include SessionsHelper

  def after_sign_in_path_for(resource)
    has_contact_info = OrgContact.find_by(org_person_id: current_org_person.id)
    if !has_contact_info.nil?
      if !session[:return_to].nil?
        session[:return_to]
        session.delete[:return_to]
      end
        edit_org_person_path(current_org_person.id)
    else
      edit_org_person_path(current_org_person.id)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end
end
