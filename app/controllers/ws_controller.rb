class WsController < ApplicationController
  def intranet_ping
    set_songrit :intranet, params[:ip]
    render :xml=>"<elocal><success /></elocal>"
  end
end
