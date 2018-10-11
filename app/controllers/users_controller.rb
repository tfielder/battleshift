class UsersController < ApplicationController
  def index
    results = UserResults.new
    @users_results = results.all_users
  end

  def show
    result = UserResults.new(params[:id])
    @user_result = result.one_user
  end

  def edit
    api = BattleShiftService.new(@filter)
    @user = api.fetch_one_user_data
  end
end
#add block in application.html.erb for flash messages
