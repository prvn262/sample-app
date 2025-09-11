class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
   # user  && user.authenticate
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid Email/password combination"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end



# Possible results of user && user.authenticate.:


# User           Password         Condition (user && user.authenticate(password)) Result
# nonexistent   (nil) anything   nil && [anything] → false 
# valid user    wrong password   true && false → false 
# valid user   right password    true && true → true
