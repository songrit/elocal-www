class TourismController < ApplicationController
  def index
    redirect_to :controller => "activity", :type => 4
  end
end
