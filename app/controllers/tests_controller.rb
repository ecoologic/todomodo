class TestsController < ApplicationController

  def test
    session["announcements_hide_time"] = nil
    render :nothing => true
  end

  def debug
    debugger
    render :nothing => true
  end

end