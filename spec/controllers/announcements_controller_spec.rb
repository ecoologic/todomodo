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

describe AnnouncementsController do

  describe 'GET hide_current' do 

    it 'should update announcement_hide_time in session' do
      Capybara::current_session[:announcements_hide_time] = nil
      get 'hide_current', :format => :js
      Capybara::current_session[:announcements_hide_time].class.should be Time # TODO: implement timecop gem
    end
    
  end


  # This should return the minimal set of attributes required to create a valid
  # Announcement. As you add validations to Announcement, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all announcements as @announcements" do
      announcement = Announcement.create! valid_attributes
      get :index
      assigns(:announcements).should eq([announcement])
    end
  end

  describe "GET show" do
    it "assigns the requested announcement as @announcement" do
      announcement = Announcement.create! valid_attributes
      get :show, :id => announcement.id.to_s
      assigns(:announcement).should eq(announcement)
    end
  end

  describe "GET new" do
    it "assigns a new announcement as @announcement" do
      get :new
      assigns(:announcement).should be_a_new(Announcement)
    end
  end

  describe "GET edit" do
    it "assigns the requested announcement as @announcement" do
      announcement = Announcement.create! valid_attributes
      get :edit, :id => announcement.id.to_s
      assigns(:announcement).should eq(announcement)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Announcement" do
        expect {
          post :create, :announcement => valid_attributes
        }.to change(Announcement, :count).by(1)
      end

      it "assigns a newly created announcement as @announcement" do
        post :create, :announcement => valid_attributes
        assigns(:announcement).should be_a(Announcement)
        assigns(:announcement).should be_persisted
      end

      it "redirects to the created announcement" do
        post :create, :announcement => valid_attributes
        response.should redirect_to(Announcement.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved announcement as @announcement" do
        # Trigger the behavior that occurs when invalid params are submitted
        Announcement.any_instance.stub(:save).and_return(false)
        post :create, :announcement => {}
        assigns(:announcement).should be_a_new(Announcement)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Announcement.any_instance.stub(:save).and_return(false)
        post :create, :announcement => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested announcement" do
        announcement = Announcement.create! valid_attributes
        # Assuming there are no other announcements in the database, this
        # specifies that the Announcement created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Announcement.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => announcement.id, :announcement => {'these' => 'params'}
      end

      it "assigns the requested announcement as @announcement" do
        announcement = Announcement.create! valid_attributes
        put :update, :id => announcement.id, :announcement => valid_attributes
        assigns(:announcement).should eq(announcement)
      end

      it "redirects to the announcement" do
        announcement = Announcement.create! valid_attributes
        put :update, :id => announcement.id, :announcement => valid_attributes
        response.should redirect_to(announcement)
      end
    end

    describe "with invalid params" do
      it "assigns the announcement as @announcement" do
        announcement = Announcement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Announcement.any_instance.stub(:save).and_return(false)
        put :update, :id => announcement.id.to_s, :announcement => {}
        assigns(:announcement).should eq(announcement)
      end

      it "re-renders the 'edit' template" do
        announcement = Announcement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Announcement.any_instance.stub(:save).and_return(false)
        put :update, :id => announcement.id.to_s, :announcement => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested announcement" do
      announcement = Announcement.create! valid_attributes
      expect {
        delete :destroy, :id => announcement.id.to_s
      }.to change(Announcement, :count).by(-1)
    end

    it "redirects to the announcements list" do
      announcement = Announcement.create! valid_attributes
      delete :destroy, :id => announcement.id.to_s
      response.should redirect_to(announcements_url)
    end
  end

end
