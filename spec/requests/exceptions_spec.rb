# TODO: is this file useful? (clone of applications_spec)
require 'spec_helper'

describe "Exceptions" do
  describe "GET /" do
    it "should show welcome page for guest user" do
      # this is not using capybara
      get root_path
      response.status.should be(200)
    end
  end
end
