require 'spec_helper'

describe User do

  describe 'to_s' do

    it 'should be unique for all user' do
      @user1 = Factory :user, :name => 'erik'
      @user2 = Factory :user, :name => 'erik'

      @user1.to_s.should_not be @user2.to_s
      @user1.to_s.should_not be_blank
      @user2.to_s.should_not be_blank
    end

  end

  describe 'uniquify_name' do

    describe 'when the name is unique' do
      it 'should save the model with that name'
    end

    describe 'when the name is not unique' do
      it 'should save the model with a unique name (not empty)'
    end

  end


end
