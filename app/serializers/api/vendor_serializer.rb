module Api
  class VendorSerializer < ActiveModel::Serializer
    attributes :id, :name, :address, :city, :state, :zip, :price_rating
  end
end
