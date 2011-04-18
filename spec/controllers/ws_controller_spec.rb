require 'spec_helper'

def post_request(endpoint, xml)
  body= File.open(xml).read
  request.env['content_type'] = 'application/xml'
  request.env['RAW_POST_DATA'] =  body
  post endpoint
end

describe WsController do
  integrate_views
  it "should receive post from intranet" do
    @post= mock_model(Post, :intranet_id=>6)
    Post.should_receive(:find_or_create_by_intranet_id).and_return(@post)
    @post.stub(:update_attributes)
    post_request :post, 'doc/post_sample.xml'
    response.should have_text('ok')
  end
end
