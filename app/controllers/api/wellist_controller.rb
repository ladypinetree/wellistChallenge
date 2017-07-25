module Api
  class WellistController < ApiBaseController
  before_action :set_wellist, only: [:show, :update, :destroy]


  # GET /wellists/1
  # GET /wellists/1.json
  #show shows a users wellist, with vendors inline
  def show
    render json: @wellist
  end

  # POST /wellists
  # POST /wellists.json
  def create
    @wellist = Wellist.new(wellist_params)

    if @wellist.save
      render json: @wellist, status: :created, location: @wellist
    else
      render json: @wellist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wellists/1
  # PATCH/PUT /wellists/1.json
  # update adds multiple vendors to the wellist
  # update adds a vendor to the wellist
  # update allows us to hide vendors from the wellistry
  def update
    @wellist = Wellist.find(params[:id])

    if @wellist.update(wellist_params)
      head :no_content
    else
      render json: @wellist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wellists/1
  # DELETE /wellists/1.json
  #destroy removes a vendor from the wellist when called with user id and vendor id
  #destroy removes a vendor from the wellist when called with user id and vendor id
  def destroy
    @wellist.destroy

    head :no_content
  end

  private

    def set_wellist
      @wellist = Wellist.find(params[:id])
    end

    def wellist_params
      params.require(:wellist).permit(:vendor_id, :user_id)
    end
  end
end
