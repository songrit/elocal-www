require 'spec_helper'

describe ActivityController do
  integrate_views
  before(:each) do
    @post= mock_model(Post, :subject=>"aa", :body=>"bb", :pic_postimg=>"",
      :post_type_name=>"ข่าว", :created_at => Time.now, :video => "" )
    Post.stub(:find).and_return(@post)
  end
  it "can read more" do
    get :post, :id=>1
    response.should have_tag "p", @post.body
  end
end
