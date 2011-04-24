require 'spec_helper'

describe WebboardController do
  before(:each) do
    @user= mock_model(User, :login=>'test', :full_name=>'test')
    @reply= mock_model(Reply, :notice_id=>1, :body => "value", 
    :pic => "", :user => @user, :created_at => Time.now   )
    @replies= [@reply]
    @replies.stub!(:build).and_return(@reply)
    @notice= mock_model(Notice, :subject=>'aa', :body => "bb", 
    :created_at=>Time.now, :pic => "", :user=>@user, 
    :replies=>@replies, :update_attributes => true )
  end
  describe "controller actions" do
    integrate_views
    it "should show index with paginate" do
      @notices= [@notice].paginate :page=>1,:per_page=>1
      Notice.should_receive(:paginate).and_return(@notices)
      get :index
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
    it "should add notice to web board" do
      post :create_notice
    end
    it "should edit notice" do
      Notice.should_receive(:find).with(1).and_return(@notice)
      $xvars[:p][:id]= 1
      post :update_notice
    end
    it "admin could remove notice" do
      Notice.should_receive(:destroy).with(1)
      $xvars[:p][:id]= 1
      get :rm_notice
    end
    it "should reply" do
      Notice.should_receive(:find).with(1).and_return(@notice)
      @reply.should_receive(:save)
      $xvars[:p][:id]= 1
      post :create_reply 
    end
    it "delete reply" do
      Reply.should_receive(:destroy).with(1)
      $xvars[:p][:id]= 1
      get :rm_reply
    end
  end
end
