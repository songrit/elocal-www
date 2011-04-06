class ActivityController < ApplicationController
  def index
    @news= News.all
  end
  def create_news
    News.create! $xvars[:enter_news][:news]
  end
end
