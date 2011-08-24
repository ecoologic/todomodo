class TestsController < ApplicationController

  def test
  end

  def test_error
    adsfasdfas
  end

  def debug
    debugger
    redirect_to :back
  end

  def destroy_session
    debugger
    session.each {|k,v| session.delete k} # TODO: any better?
    redirect_to root_path
  end

end
