class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password]) #double check
      session[:user_id] = user.id
      #for authorization
    else
      flash[:failure] = "Incorrect Credentials. Please Try Again."
      redirect_to '/login'
    end
  end

  def destroy
    session.delete[:user_id]
    flash[:success] = "You have successfully logged out."
    redirect_to root_path
  end
end