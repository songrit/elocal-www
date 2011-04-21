require 'spec_helper'

describe ActivityController do
  integrate_views
  before(:each) do
    @post= mock_model(Post, :subject=>"aa", :body=>"bb")
    Post.stub(:find).and_return(@post)
  end
  it "can read more" do
    get :post, :id=>1
    response.should have_text @post.body
  end
end
