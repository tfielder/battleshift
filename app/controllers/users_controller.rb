class UsersController < ApplicationController
  def index
    results = UserResults.new
    @users_results = results.all_users
  end

  def show
    @user_result = UserResults.new(params[:id])
  end
end
