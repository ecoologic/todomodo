require "spec_helper"

describe AnnouncementsController do
  describe "routing" do

    it "routes to #index" do
      get("/announcements/hide_currents").should route_to("announcements#hide_currents")
    end

  end
end
