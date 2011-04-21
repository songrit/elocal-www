class ProcureController < ApplicationController
  def index
    redirect_to :controller => "activity", :type => 7
  end
end
