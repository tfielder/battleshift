class WelcomeController < ApplicationController
  def index

  end

  def login
    binding.pry
    if 1 == 1
      flash[:notice] = "You did it!"
      redirect_to 
    else
      flash[:notice] = "Incorrect credentials, try again"
      redirect_to '/'
    end
  end
end