class RegistrationsController < Devise::RegistrationsController

  def show
    @user = current_user
    render 'show.html.erb'
  end

  def view_profile
    @user = User.find(params[:id])
    render 'show.html.erb'
  end

private


end
