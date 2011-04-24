class Notice < ActiveRecord::Base
  belongs_to :user, :foreign_key => "gma_user_id"
  has_many :replies
end
