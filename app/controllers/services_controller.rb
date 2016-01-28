class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  helper_method :sort_column, :sort_direction

  # GET /services
  # GET /services.json
  def index
    @user = current_user
    @services = Service.order(sort_column + " " + sort_direction).paginate(:per_page => 8, :page => params[:page])
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @user = current_user
    @service = Service.find(params[:id])
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
    newService.creator = @user.first_name + " " + @user.last_name
    respond_to do |format|
    @user.services << newService
    @user.save
      if @user.save
        @service = multiple_photos(newService)
        format.html { render :index, notice: 'Service was successfully created.' }
        format.json { render :index, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    @services = Service.order(sort_column + " " + sort_direction).paginate(:per_page => 8, :page => params[:page])
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @service.update(service_params)
        @service = multiple_photos(@service)
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
      company_search = params[:company_search].strip
      @company_services = Service.where("lower(company_name) LIKE (?)", "%#{company_search.downcase}%")
    end
    if !params[:equipment_description_search].nil?
      equipment_description_search = params[:equipment_description_search].strip
      @equipment_description = Service.where("lower(equipment_description) LIKE (?)", "%#{equipment_description_search.downcase}%")
    end
    if !params[:service_type_search].nil?
      service_type_search = params[:service_type_search].strip
      @service_type = Service.where("lower(service_type) LIKE (?)", "%#{service_type_search.downcase}%")
    end
    if !params[:day_search].nil?
      day_search = params[:day_search].strip
      @day = Service.where("lower(day_option1) LIKE (?) OR lower(day_option2) LIKE (?)", "%#{day_search.downcase}%", "%#{day_search.downcase}%")
    end
  end

  def display_equipment_list
    service = Service.find(params[:id])
    send_file service.inventory.path, :type => service.inventory_content_type
  end

  def remove_image
    @service = Service.find(params[:id])
    @service.image = nil
    @service.save
    redirect_to @service, flash: { success: 'User profile photo has been removed.' }
  end

  private
    # Setting defaults for sorting
    def sort_column
      Service.column_names.include?(params[:sort]) ? params[:sort] : "company_name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def multiple_photos(newService)
      if params[:photos]
        params[:photos].each do |image|
          newService.pictures.create(photo: image)
        end
      end
        return newService
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:service_type, :onsite_contact_name, :onsite_contact_phone, :company_name, :address, :city, :state, :zipcode, :equipment_description, :floor, :room, :parking_instructions, :day_option1, :day_option2, :time_option1, :time_option2, :pallets, :image, :inventory, :other_file1, :photos, :creator)
    end
end
