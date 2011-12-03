# controller for searches
class ArtistsController < ApplicationController

  # from the artists search
  def show
    if params[:name]
      discogs = Discogs::Wrapper.new APP_NAME
      @artist = discogs.get_artist params[:name]
    end
  end


end
