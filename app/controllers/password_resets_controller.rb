class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]   # Finds user by email
  before_action :valid_user, only: [:edit, :update]   # Checks if user exists, is activated, token valid
  before_action :check_expiration, only: [:edit, :update]  # Checks if reset link expired

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render "edit", status: :unprocessable_entity
    elsif @user.update(user_params)
      log_in @user
      @user.update_attribute(:reset_digest, nil)
      # invalidate the reset token immediately. after reset password.
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render "edit", status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end


  # finds user by email
  def get_user
    @user = User.find_by(email: params[:email])
  end

  # confirms a valid user
  def valid_user
    unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
    end
  end

  # check reset token expired or not
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end
end
