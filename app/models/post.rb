class Post < ActiveRecord::Base
  named_scope :recent, :limit => 10, :order => 'begin_on DESC'
end
