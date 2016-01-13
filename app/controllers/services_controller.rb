class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /services
  # GET /services.json
  def index
    @user = current_user
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @user = current_user
  end

  # GET /services/new
  def new
    @user = current_user
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
    @user = current_user
  end

  # POST /services
  # POST /services.json
  def create
    @user = current_user
    newService = Service.new(service_params)
    respond_to do |format|
    @user.services << newService
    @user.save
      if @user.save
        format.html { render :index, notice: 'Service was successfully created.' }
        format.json { render :index, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    if !params[:company_search].nil?
      company_search = params[:company_search].strip.downcase
      @company_services = Service.where("company_name LIKE (?)", "%#{company_search}%")
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:service_type, :onsite_contact_name, :onsite_contact_phone, :company_name, :address, :city, :state, :zipcode, :equipment_description, :floor, :room, :parking_instructions, :day_option1, :day_option2, :time_option1, :time_option2)
    end
end
