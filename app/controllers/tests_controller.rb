class TestsController < ApplicationController

  def test
  end

  def debug
    debugger
    render :nothing => true
  end

  def destroy_session
    session = {}
    render :nothing => true
  end

end
