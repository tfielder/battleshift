class UserView
  attr_reader :name, :email
  def initialize(hash = {})
      @name = hash[:name]
      @email = hash[:email]
      @id = hash[:id]
  end

  # def users
  #   binding.pry
  #   @users ||= InternalApiService.user_search.map do |user_data|
  #     User.new(user_data)
  #   end
  # end

  # private
  # def service
  #   InternalApiService.new(@id)
  # end
end