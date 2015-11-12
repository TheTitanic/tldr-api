class Snippet < ActiveRecord::Base
  belongs_to :document
  belongs_to :profile
  has_many :translations
end
