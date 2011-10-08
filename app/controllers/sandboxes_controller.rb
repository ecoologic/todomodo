# for development and test purpose only
class SandboxesController < ApplicationController

  respond_to :html, :js, :json

  before_filter :redirect_on_production

  # GET /tests/test (see template)
  def test
  end

  # GET /test_js
  def test_js
    @value = 'fooo!!!'
    respond_with :js
  end

  # raise a simple error
  def test_error
    raise 'This is a test error!'
  end

  # stop execution
  def debug
    binding.pry

    if request.env['HTTP_REFERER'].present?
      redirect_to :back
    else
      redirect_to root_path
    end
  end

  # clear the session
  def clear_session
    session.clear
    redirect_to root_path
  end

private # =====================================================================

  # redirect to root path in production environment
  def redirect_on_production
    redirect_to root_path if Rails.env.production?
  end

end
