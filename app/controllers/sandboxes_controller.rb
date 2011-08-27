# for development and test purpose
class SandboxesController < ApplicationController

  before_filter :redirect_on_production

  # GET /tests/test (see template)
  def test
  end

  # raise a simple error
  def test_error
    raise 'This is a test error!'
  end

  # stop execution
  def debug
    binding.pry
    redirect_to :back
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
