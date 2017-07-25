module Api
  class WellistVendorSerializer < ActiveModel::Serializer
    attributes :id
    has_one :wellist
    has_one :vendor
  end
end
