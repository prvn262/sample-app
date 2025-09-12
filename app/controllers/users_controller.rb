class UsersController < BaseController
  skip_before_action :authenticate_user, only: [:new, :create]

  def index
    @users = User.all

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the sample App"
      redirect_to @user
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    puts params.to_yaml
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end





# params[:user]
# "user" => { "name" => "Foo Bar",
#             "email" => "foo@invalid",
#             "password" => "[FILTERED]",
#             "password_confirmation" => "[FILTERED]" }