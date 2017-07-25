class Wellist < ActiveRecord::Base
  belongs_to :user
  has_many :vendors, through: :wellist_vendors
  has_many :wellist_vendors
end
