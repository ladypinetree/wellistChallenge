class User < ActiveRecord::Base
  has_one :wellist
  has_many :vendors, through: :wellist
end
