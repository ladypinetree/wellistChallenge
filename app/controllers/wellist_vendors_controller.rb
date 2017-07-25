class WellistVendorsController < ApiBaseController
  before_action :set_wellist_vendor, only: [:show, :edit, :update, :destroy]

  # GET /wellist_vendors
  # GET /wellist_vendors.json
  def index
    @wellist_vendors = WellistVendor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wellist_vendors }
    end
  end

  # GET /wellist_vendors/1
  # GET /wellist_vendors/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wellist_vendor }
    end
  end

  # GET /wellist_vendors/new
  def new
    @wellist_vendor = WellistVendor.new
  end

  # GET /wellist_vendors/1/edit
  def edit
  end

  # POST /wellist_vendors
  # POST /wellist_vendors.json
  def create
    @wellist_vendor = WellistVendor.new(wellist_vendor_params)

    respond_to do |format|
      if @wellist_vendor.save
        format.html { redirect_to @wellist_vendor, notice: 'Wellist vendor was successfully created.' }
        format.json { render json: @wellist_vendor, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @wellist_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wellist_vendors/1
  # PATCH/PUT /wellist_vendors/1.json
  def update
    respond_to do |format|
      if @wellist_vendor.update(wellist_vendor_params)
        format.html { redirect_to @wellist_vendor, notice: 'Wellist vendor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wellist_vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wellist_vendors/1
  # DELETE /wellist_vendors/1.json
  def destroy
    @wellist_vendor.destroy
    respond_to do |format|
      format.html { redirect_to wellist_vendors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wellist_vendor
      @wellist_vendor = WellistVendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wellist_vendor_params
      params.require(:wellist_vendor).permit(:wellist_id, :vendor_id)
    end
end
