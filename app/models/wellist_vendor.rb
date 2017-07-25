class WellistVendor < ActiveRecord::Base
  belongs_to :wellist, inverse_of: :wellist_vendors
  belongs_to :vendor, inverse_of: :wellist_vendors
end
