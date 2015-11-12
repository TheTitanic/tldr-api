class Document < ActiveRecord::Base
  belongs_to :profile
  has_many :snippets
end
