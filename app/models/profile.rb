class Profile < ActiveRecord::Base
  belongs_to :account
  has_many :comments
  has_many :documents
  has_many :snippets
  has_many :translations
end
