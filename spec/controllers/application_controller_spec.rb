require 'spec_helper'

describe ApplicationController do

  describe 'session[:has_just_auth]' do

    describe 'when not logged in' do
      it 'should be nil' do
        get 'show'
        @request.session[:has_just_auth].should be nil
      end
    end
    
    describe 'after login' do
      before(:each) do
        login_user
        get 'show'
      end

      it 'should be true the first request' do
        @request.session[:has_just_auth].should be true
      end

      it 'should be false the second request' do
        get 'show'
        @request.session[:has_just_auth].should be false
      end

      describe 'after logout' do
        before(:each) do
          logout_user
          get 'show'
        end

        it 'should be nil'
        # TODO: when you know how to logout...
        # do
        #   @request.session[:has_just_auth].should be nil
        # end
      end

    end

  end



end
