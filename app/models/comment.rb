class Comment < ActiveRecord::Base
  belongs_to :profile
  belongs_to :translation
end