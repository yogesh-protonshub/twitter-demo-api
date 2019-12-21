class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
    new_user = User.new(user_params)
    new_user.save
    if new_user.errors.any?
    	render :json => {:message => "Email has already been taken"}, status: :unprocessable_entity
    else
    	@current_user = new_user
    	render "users/show"
    end
  end

  def update
    super
  end

  private
  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation,:name)
  end
end 