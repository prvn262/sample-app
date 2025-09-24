class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end






















# इसमें सिर्फ एक ही action होगा → edit action (क्योंकि activation link GET request भेजेगा)।
# इस action में logic होगा:
# ईमेल से user ढूँढना।
# Token match करना।
# User को activate करना।
