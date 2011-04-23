class ActivityController < ApplicationController
  def index
    if !params[:type] || params[:type].empty?
      @posts= Post.all :conditions=>"post_type=1 OR post_type=2"
      @title= "ข่าว/กิจกรรม"
    else
      @posts= Post.all :conditions=>["post_type=?", params[:type]]
      @title= post_type(params[:type].to_i)
    end
  end
  def post
    @post= Post.find params[:id]
  end
  def rm_post
    Post.destroy $xvars[:p][:id]
  end
end
