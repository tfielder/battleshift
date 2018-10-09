class UsersController < ApplicationController
  def show
    # @conn = Faraday.new(url: "http://localhost3000/") do |faraday|
    #   faraday.headers["X-API-KEY"] = "S9JON3ruNOI6XiyymcnZ7gtsjnToPxuXyT0bgeaX"
    #   faraday.adapter Faraday.default_adapter
    # end
    #response = Users.find(params[:id])
    # response = @conn.get("/congress/v1/members/house/#{state}/current.json")
    response = render json: User.find(params[:id])

    @user = JSON.parse(response.body, symbolize_names: true)[:results]

    #@user = Users.find(params[:id])
    end
end