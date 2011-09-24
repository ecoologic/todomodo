# application controller
# consider applicationLayoutController does not exists.
class ApplicationController < ActionController::Base

  helper_method :save_flash!

  respond_to :html, :js, :json, :xml, :csv

  protect_from_forgery

  before_filter :set_has_just_auth, :get_current_announcements,
                # a little optimization
                :except => [:create, :update, :destroy]

  # welcome page
  def show
  end

  # override default devise landing page after login
  # http://rubydoc.info/gems/devise/1.1.2/Devise/Controllers/Helpers
  def after_sign_in_path_for(resource_or_scope)
    root_path # redundant if you want to go to root_path as that's the default
  end

protected # ===================================================================

  # load announcements to be shown
  def get_current_announcements
    @current_announcements = Announcement.currents session[:announcements_hide_time]
  end

private # =====================================================================

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

  # assign flash the correct message
  # depending on model saving success
  # returns saved (though it can be chained)
  def save_flash!(saved)
    saved ? flash[:notice] = 'saved' : flash[:error] = 'error!'
    saved
  end

end
