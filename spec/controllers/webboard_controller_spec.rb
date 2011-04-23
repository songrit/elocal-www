require 'spec_helper'

describe WebboardController do
  describe "controller actions" do
    integrate_views
    before(:each) do
      @notice= mock_model(Notice, :subject=>'aa', :body => "bb", :created_at=>Time.now)
    end
    it "should show index with paginate" do
      Notice.should_receive(:paginate).and_return([@notice])
      get :index
      response.should have_tag('a', @notice.subject)
    end
    it "should show each notice"
  end
  describe "gma methods" do
    before(:each) do
      $xvars= {:p=>{}}
      $xvars[:enter]= {:subject=>'aa', :body => "bb" }
    end
    it "should manage web board" do
      post :create_notice
    end
  end
end
