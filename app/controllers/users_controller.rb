class UsersController < ApplicationController
  def index
    results = UserResults.new
    @users_results = results.all_users
  end

  def show
    result = UserResults.new(params[:id])
    @user_result = result.one_user
  end

end
