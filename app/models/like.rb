class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :secret
  validates_uniqueness_of :secret 


end
