# application controller
# consider applicationLayoutController does not exists.
class ApplicationController < ActionController::Base

  respond_to :html, :js, :json, :xml, :csv

  protect_from_forgery

  before_filter :set_has_just_auth, :get_current_announcements,
                :except => [:create, :update, :destroy]

#   rescue_from Exception, :with => :handle_error #, :if => Rails.env.production?

  # welcome page
  def show
  end

  # show a general, user friendly error page
#   def error
#     debugger
#     @current_announcements = []
#     logger.debug '>>>>>>>>>>>> error action called'
#     respond_with :html, :layout => 'error'
#   end

  # override default devise landing page after login
  # http://rubydoc.info/gems/devise/1.1.2/Devise/Controllers/Helpers
  def after_sign_in_path_for(resource_or_scope)
    root_path # redundant if you want to go to root_path
  end

protected # ===================================================================

  # load announcements to be shown
  def get_current_announcements
    @current_announcements = Announcement.currents session[:announcements_hide_time]
    puts "get_current_announcements size: #{@current_announcements.size} Time: #{session[:announcements_hide_time]}"
  end

#   def handle_error(exception)
#     logger.fatal "#{exception}"
#     logger.debug '>>>>>>> handle_error'
#     redirect_to error_path
#   end

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

end
