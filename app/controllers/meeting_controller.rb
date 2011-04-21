class MeetingController < ApplicationController
  def index
    redirect_to :controller => "activity", :type => 3
  end
end
