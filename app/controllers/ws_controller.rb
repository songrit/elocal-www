class WsController < ApplicationController
  def intranet_ping
    set_songrit :intranet_ip, params[:ip]
    render :xml=>"<elocal><Success /></elocal>"
  end
end
