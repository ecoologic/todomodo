require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe UsersController do
  before(:each) do
    login_user
  end

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all users as @users" do
      user = Factory(:user)
      get :index
      assigns(:users).should eq([user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      user = Factory(:user)
      get :show, :id => user.id.to_s
      assigns(:user).should eq(user)
    end
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      user = Factory(:user)
      get :edit, :id => user.id.to_s
      assigns(:user).should eq(user)
    end
  end


  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        user = Factory(:user)
        # Assuming there are no other users in the database, this
        # specifies that the User created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        User.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => user.id, :user => {'these' => 'params'}
      end

      it "assigns the requested user as @user" do
        user = Factory(:user)
        put :update, :id => user.id, :user => valid_attributes
        assigns(:user).should eq(user)
      end

      it "redirects to the user" do
        user = Factory(:user)
        put :update, :id => user.id, :user => valid_attributes
        response.should redirect_to(user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        user = Factory(:user)
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, :id => user.id.to_s, :user => {}
        assigns(:user).should eq(user)
      end

      it "re-renders the 'edit' template" do
        user = Factory(:user)
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, :id => user.id.to_s, :user => {}
        response.should render_template("edit")
      end
    end
  end

end
