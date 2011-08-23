require 'spec_helper'

describe UsersController do

  describe "GET 'update_note'" do
    it "should be successful" do
      get 'update_note'
      response.should be_success
    end
  end

end
