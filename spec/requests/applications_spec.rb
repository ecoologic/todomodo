require 'spec_helper'

describe "Applications" do
  describe "GET /" do
    it "should show welcome page for guest user" do
      visit root_path
      page.body.should include 'welcome'
    end
  end
end
