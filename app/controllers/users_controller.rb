# controller for user management
class UsersController < ApplicationController

  respond_to :html, :js, :json

  before_filter :authenticate_user! # see devise

  # toggle user note visibility
  def toggle_current_user_note
    session[:show_current_user_note] = !session[:show_current_user_note]

    respond_with :js
  end

  # updated current_user.note if changed
  # and toggle current user note visibility
  def update_current_user_note
    @user = current_user
    session[:show_current_user_note] = !session[:show_current_user_note]

    save_flash! @user.note == params[:current_user_note] ||
                @user.update_attribute(:note, params[:current_user_note])

    respond_with :js
  end

  # GET /users/1-erik
  def show
    @user = User.find params[:id]
  end

  # GET /users/1/edit
  def edit
    @user = User.find params[:id]
  end

  # PUT /users/1/update
  def update
    @user = User.find params[:id]
    ok = @user.update_attributes params[:user] rescue nil
    @user.errors[:base] << "Maybe a problem with your image?" if ok.nil?
    render save_flash!(ok) ? :show : :edit
  end

  # GET /users
  def index
    @users = User.all
  end

end
