class UsersController < ApplicationController
  def show
    id = params[:id]
    # hash = {}
    # hash[:id] = id
    # @user = UserView.new(hash)

    #@user = InternalApiService.user_search(id)   #may need to initialize

    @connection = Faraday.new(url: "http://localhost:3000") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = @connection.get("http://localhost:3000/api/v1/users/#{id}")

    @user = UserView.new(JSON.parse(response.body, symbolize_names: true))
  end

  def index
    @connection = Faraday.new(url: "http://localhost:3000") do |f|
      f.adapter Faraday.default_adapter
    end
    response = @connection.get("/api/v1/users")
    #  @users = InternalApiService.users_search

    @users = JSON.parse(response.body, symbolize_names: true)
    @all_users = @users.map do |row|
      UserView.new(row)
    end
  end
end