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
    filter = params[:id]
    api = BattleShiftService.new(filter)
    @user = api.fetch_one_user_data
  end

  def update
    # redirect_to proc { action: "patch", api_v1_user_path(@user) }
    redirect_to url_for(:controller => Api::V1::UsersController, :action => :update)
  end
end
#add block in application.html.erb for flash messages
