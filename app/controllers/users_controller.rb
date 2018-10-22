class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    saved = @user.save
    if saved
      @user.update(api_key: @user.create_api_key)
      @user.send_activation_email
      session[:user_id] = @user.id
    #  UserMailer.account_activation(user).deliver_now
      @current_user = @user
      redirect_to "/dashboard"
    else
      flash[:notice] = "Something went wrong, please try again."
      redirect_to "/register"
    end
  end

  def dashboard
    @user = current_user
    # if params[:email] && params[:password]
    #   if User.find_by(:email).id == User.find_by(:password).id
    #     @user = current_user
    #   else
    #     flash[:notice] = "Incorrect credentials, try again"
    #     redirect_to login_path
    #   end
    # end
    flash[:notice] = "This account has not yet been activated. Please check your email." if !@user.activated?
    flash[:notice] = "Status: Active" if @user.activated?
  end

  def index
    results = UserResults.new
    results_1 = results.all_users
    @users_results = results_1.sort_by {|user| user.id}
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
      params.require(:user).permit(:id, :name, :email, :password, :password_confirmation, :api_key)
    end

end
