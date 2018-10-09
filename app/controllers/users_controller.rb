class UsersController < ApplicationController
  def show
    id = params[:id]
    @connection = Faraday.new(url: "http://localhost:3000/api/v1/users/#{id}") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = @connection.get("http://localhost:3000/api/v1/users/#{id}")
    #User.new         could create a temporary object to use from the call

    @user = User.new(@JSON.parse(response.body, symbolize_names: true))

    end
end