module Api
  class VendorsController < ApiBaseController

    def create
      @vendor = Vendor.create(vendor_params)

      render json: @vendor
    end
    private

    def vendor_params
      params.require(:vendor).permit(:category, :care_type, :care_sub_type, :name, :price_rating)
    end
  end
end
