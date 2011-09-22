require 'spec_helper'

describe User do
  before(:each) do
    @user1 = Factory :user, :name => USER_NAME
    @user2 = Factory :user, :name => USER_NAME
    @user3 = Factory :user, :name => nil
    @user4 = Factory :user, :name => ''
  end

  describe 'to_s' do

    it 'should be unique for all user' do
      @user1.to_s.should_not be @user2.to_s
    end

    it 'should never be blank' do
      @user1.to_s.should_not be_blank
      @user2.to_s.should_not be_blank
      @user3.to_s.should_not be_blank
      @user4.to_s.should_not be_blank
    end

  end

end
