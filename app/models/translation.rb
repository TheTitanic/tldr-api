class Translation < ActiveRecord::Base
  belongs_to :profile
  belongs_to :snippet
  has_many :comments
end
