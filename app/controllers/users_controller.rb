# controller for user management
class UsersController < ApplicationController

  respond_to :html, :js, :json

  before_filter :authenticate_user! # see devise

  # updated current_user.note
  def update_current_user_note
    @user = current_user
    if @user.update_attribute :note, params[:current_user_note]
      flash[:notice] = 'Note saved'
    else
      flash[:error] = 'Note could not be saved'
    end
    
    respond_with :js
  end

end
