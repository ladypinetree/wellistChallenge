module Api
  class WellistSerializer < ActiveModel::Serializer
    attributes :id, :vendors, :user

    def vendors
      object.vendors.pluck(:name, :care_type)
    end
  end
end
