class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # user  && user.authenticate
      if user.activated?
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        redirect_back_or user
        # redirect_to user
      else
        flash[:warning] = "Account not activated. Check your email for the activation link."
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid Email/password combination"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end



# Possible results of user && user.authenticate.:


# User           Password         Condition (user && user.authenticate(password)) Result
# nonexistent   (nil) anything   nil && [anything] → false 
# valid user    wrong password   true && false → false 
# valid user    right password    true && true → true
