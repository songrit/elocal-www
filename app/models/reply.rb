class Reply < ActiveRecord::Base
  belongs_to :user, :foreign_key => "gma_user_id"
end
