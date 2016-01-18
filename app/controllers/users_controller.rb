class UsersController < ApplicationController
before_action :authenticate_user!

  def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_in){ |u| u.permit(:email, :password) }
     devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:first_name, :email, :password, :password_confirmation)}
     devise_parameter_sanitizer.for(:account_update){ |u| u.permit(:first_name, :email, :password, :password_confirmation) }
   end

  def index
     @users = User.paginate(:page => params[:page], :per_page => 16)
  end

  def show
    @user = current_user
    render 'show.html.erb'
  end

  def edit
    @user = User.find(params[:id])
  end

  def view_profile
    @user = User.find(params[:id])
    render 'show.html.erb'
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def search_users
    if !params[:creator].nil?
      search_string = params[:creator]
      @user = User.basic_search({first_name: search_string, last_name: search_string}, false).paginate(:page => params[:page], :per_page => 16)
    end
  end

  def newPic
    @user = current_user
  end

  def cancel
  end

  def addUserPicture
    @user = current_user
    if params[:image_cb2] == "3"
      @user.image = @user.image_from_url(params[:image_url2])
    else
      @user.image = params[:user_image]
    end
    @user.save
    redirect_to users_show_path
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :current_password, :company_name, :company_address, :company_city, :company_state, :company_zip, :company_phone, :onsite_contact_name, :onsite_contact_phone, :parking_instructions, :admin, :image)
  end
end
