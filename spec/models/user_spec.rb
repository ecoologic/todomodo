require 'spec_helper'

describe User do

  describe 'to_s' do

    it 'should be unique for all user' do
      @user1 = Factory :user, :name => 'erik'
      @user2 = Factory :user, :name => 'erik'
      @user1.to_s.should_not be @user2.to_s
    end

  end

  describe 'save model' do

    describe 'name (uniquify_name)' do
      it 'should save when correct'
      it 'should be reverted when not valid'
    end

  end

end
