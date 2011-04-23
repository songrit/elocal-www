require 'spec_helper'

describe WebboardController do
  describe "controller actions" do
    integrate_views
    before(:each) do
      @user= mock_model(User, :login=>'test')
      @notice= mock_model(Notice, :subject=>'aa', :body => "bb", 
        :created_at=>Time.now, :pic => "", :user=>@user )
      @notices= [@notice].paginate :page=>1,:per_page=>1
    end
    it "should show index with paginate" do
      Notice.should_receive(:paginate).and_return(@notices)
      get :index
      # assigns[:notices].stub!(:total_pages).and_return(1)
      response.should have_tag('a', @notice.subject)
    end
    it "should show each notice" do
      Notice.should_receive(:find).with('1').and_return(@notice)
      get :show, :id => '1' 
    end
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
