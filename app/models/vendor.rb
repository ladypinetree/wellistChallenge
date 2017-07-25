class Vendor < ActiveRecord::Base
  has_many :wellists, through: :wellist_vendors
  has_many :wellist_vendors
end
