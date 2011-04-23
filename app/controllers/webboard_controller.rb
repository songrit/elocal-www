class WebboardController < ApplicationController
  def index
    # redirect_to :controller => "main", :action => "coming_soon"
    @notices= Notice.paginate :per_page => 20, :page => params[:page] 
  end
  def show
    @notice= Notice.find params[:id]
  end
  def create_notice
    notice= Notice.new $xvars[:enter][:notice]
    img= $xvars[:enter][:notice_pic_doc_id]
    if img
      scale_image(img)
      @pic_postimg= postimg(File.join(IMAGE_LOCATION,"f#{img}"))
      notice.pic= @pic_postimg
    end
    notice.save
    $xvars[:p][:return]= '/webboard'
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
