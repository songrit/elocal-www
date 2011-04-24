class WebboardController < ApplicationController
  def index
    # redirect_to :controller => "main", :action => "coming_soon"
    @notices= Notice.paginate :per_page => 20, :page => params[:page] 
  end
  def show
    @notice= Notice.find params[:id]
    @reply= @notice.replies.build
  end
  def create_notice
    notice= Notice.new $xvars[:enter][:notice]
    img= $xvars[:enter][:notice_pic_doc_id]
    if img
      scale_image(img)
      notice.pic= postimg(File.join(IMAGE_LOCATION,"f#{img}"))
    end
    notice.save
    $xvars[:p][:return]= '/webboard'
  end
  def update_notice
    notice = Notice.update $xvars[:p][:id], $xvars[:enter][:notice]
    img= $xvars[:enter][:notice_pic_doc_id]
    if img
      scale_image(img)
      notice.pic= postimg(File.join(IMAGE_LOCATION,"f#{img}"))
    end
    $xvars[:p][:return]= "/webboard/show/#{$xvars[:p][:id]}"
  end
  def rm_notice
    Notice.destroy $xvars[:p][:id]
    gma_notice "ลบกระทู้ #{$xvars[:p][:id]} เรียบร้อยแล้ว"
    $xvars[:p][:return]= "/webboard"
  end
  def create_reply
    @notice = Notice.find $xvars[:p][:id]
    reply= @notice.replies.build $xvars[:enter][:reply]
    img= $xvars[:enter][:reply_pic_doc_id]
    if img
      scale_image(img)
      reply.pic= postimg(File.join(IMAGE_LOCATION,"f#{img}"))
    end
    reply.save
    $xvars[:p][:return]= "/webboard/show/#{$xvars[:p][:id]}"
  end
  def rm_reply
    Reply.destroy $xvars[:p][:id]
    gma_notice "ลบตอบกระทู้ #{$xvars[:p][:id]} เรียบร้อยแล้ว"
    $xvars[:p][:return]= $xvars[:referer]
  end
  
  private
  def scale_image(img)
    max_cols= 680
    f= "#{IMAGE_LOCATION}/f#{img}"
    img = Magick::Image.read(f).first
    if img.columns > max_cols
      img = img.change_geometry(max_cols){|cols,rows,i| i.resize!(cols,rows)}
      img.write(f)
    end
    img.destroy!
  end
end
