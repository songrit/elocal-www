class UsersController < ApplicationController
  def login
    user= GmaUser.authenticate params[:login], params[:password]
    session[:module] ||= 'account'
    if user
      session[:user_id]= user.id
      $user_id= user.id
    else
      gma_log "SECURITY", "user #{params[:login]} log in failure"
      flash[:notice]= "ขออภัย รหัสไม่ถูกต้อง"
    end
    redirect_to request.referrer
  end
  def logout
    reset_session
    $user_id= anonymous.id
    redirect_to request.referrer
  end
  def new
    @title= "Register New User"
    @user= GmaUser.new :role=>"M"
  end
  def create
    @user= GmaUser.new params[:user]
    if @user.save
      flash[:notice]= "ขึ้นทะเบียนเรียบร้อยแล้ว"
      redirect_to "/"
    else
      @user.password= ""
      flash[:notice]= "ขออภัย ไม่สามารถขึ้นทะเบียนได้"
      render :action=>:new
    end
  end

  # ajax
  def subsections
    @section= Section.find params[:id]
#    include ActionView::Helpers::FormOptionsHelper
    render :text => @template.options_from_collection_for_select(@section.subsections, :id, :name)
  end
  def check_login
    red = "#FF796C" ; green = "#B5D19D"
    if params[:login].blank?
      m = "CODE MUST NOT BE BLANK" ; c = red
    elsif User.exists?(:login=>params[:login])
      m = "CODE ALREADY EXISTS" ; c = red
    else
      m = "OK" ; c = green
    end
    t= c==green ? "<img src='/images/tick.png'>" : "<img src='/images/cross.png'>"
    render :text => "#{t} <span class='status' style='background-color:#{c}'>#{m}</span>"
  end
end