require 'spec_helper'

describe SongritController do
  integrate_views

  it "could ping intranet server" do
    get :test_ping, :server=>"www.google.com"
    response.should have_text("Device is up!")
    get :test_ping, :server=>"www.google1.com"
    response.should have_text("Device is down!")
  end
  
  it "could store asset on intranet server" do
    content = File.read("public/robots.txt")
    post :test_store_asset, :content => content, :server=>"elocal.local"
    response.should have_text(/ok/)
  end
  
  it "could retrieve asset from intranet server" do
    content = File.read("public/images/add.png")
    post :test_store_asset, :content => content, :server=>"elocal.local",
      :file_name=>"add.png", :content_type=>"image/png"
    doc_id= assigns[:doc_id]
    result = RestClient.get "http://elocal.local/engine/document/#{doc_id}"
    (content.size-result.size).should <= 1
  end

end
