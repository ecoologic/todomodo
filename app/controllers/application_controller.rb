class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :get_current_announcements, :set_has_just_auth, :except => [:create, :update, :destroy]

  # TODO: rescue_from Exception, :with => :render_error

  # welcome page
  def show
  end

  # override default devise landing page after login
  # http://rubydoc.info/gems/devise/1.1.2/Devise/Controllers/Helpers
  def after_sign_in_path_for(resource_or_scope)
    root_path # redundant if you want to go to root_path
  end


private #======================================================================

  # load announcements to be shown
  def get_current_announcements
    @current_announcements = Announcement.currents session[:announcements_hide_time]
  end

  # store in session if login has just happen
  def set_has_just_auth
    if user_signed_in?
      case session[:has_just_auth]
      when nil  then session[:has_just_auth] = true
      when true then session[:has_just_auth] = false
      end
    else
      session[:has_just_auth] = nil
    end
  end

end
