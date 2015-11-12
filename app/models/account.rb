class Account < ActiveRecord::Base
  has_one :profile
end
