# controller for user management
class UsersController < ApplicationController

  respond_to :html, :js, :json

  before_filter :authenticate_user! # see devise

  # toggle user note visibility
  def toggle_current_user_note
    session[:show_current_user_note] = !session[:show_current_user_note]
    respond_with :js
  end

  # updated current_user.note
  def update_current_user_note
    @user = current_user
    ok = @user.update_attribute :note, params[:current_user_note]
    flash.merge ok ? {:notice => 'saved'} : {:error => 'error!'}

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
    ok = @user.update_attributes params[:user]

    flash.merge ok ? {:notice => 'saved'} : {:error => 'error!'}
    render      ok ? :show : :edit
  end

end
