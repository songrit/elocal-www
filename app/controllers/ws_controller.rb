class WsController < ApplicationController
  def intranet_ping
    set_songrit :intranet, params[:ip]
    render :xml=>"<elocal><success /></elocal>"
  end
  # receive post xml from intranet
  def post
    doc = Nokogiri::XML(request.body)
    id= (doc/'id').text
    # p = Post.exists?(id) ? Post.find(id) : Post.new
    p= Post.find_or_create_by_intranet_id id
    p.update_attributes :subject => (doc/'subject').text,
      :body => (doc/'body').text, :post_type => (doc/'post-type').text,
      :pic => (doc/'pic') .text, :begin_on=>(doc/'begin-on').text,
      :end_on => (doc/'end-on').text, :stick => (doc/'stick').text  
    render :text => "ok"
  end
end
