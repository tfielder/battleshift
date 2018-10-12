class UsersController < ApplicationController
  def index
    results = UserResults.new
    results = results.all_users
    @users_results = results.sort_by {|user| user.id}
  end

  def show
    result = UserResults.new(params[:id])
    @user_result = result.one_user
  end

  def edit
    filter = params[:id]
    response = BattleShiftService.new(filter)
    @user = response.fetch_one_user_data
  end

  def update
    filter = params[:id]
    response = BattleShiftService.new(filter)
    url = response.access_api
    @user = response.fetch_one_user_data
    url.patch("api/v1/users/#{@user[:id]}", body = params[:email])
    redirect_to('/users')
    flash[:notice] = "Successfully updated #{@user[:name]}"
  end
end
