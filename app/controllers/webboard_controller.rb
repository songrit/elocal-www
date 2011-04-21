class WebboardController < ApplicationController
  def index
    redirect_to :controller => "main", :action => "coming_soon"
  end
end
