class TestsController < ApplicationController

  def test
  end

  def debug
    debugger
    redirect_to :back
  end

  def destroy_session
    debugger
    session.each {|k,v| session.delete k}
    redirect_to root_path
  end

end
