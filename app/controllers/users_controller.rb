class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/dashboard"
    else
      render :new
    end
  end

  def dashboard
  
  end

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
    url.patch("api/v1/users/#{@user[:id]}", {email: params[:email]})
    redirect_to('/users')
    flash[:notice] = "Successfully updated #{@user[:name]}"
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end

