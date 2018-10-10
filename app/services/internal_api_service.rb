class InternalApiService

  # def initialize(id = 0)
  #   @id = id
  # end
  # 
  # def user_search
  #   get_json("/api/v1/users/#{@id}")
  # end
  #
  # def users_search
  #   get_json("/api/v1/users")
  # end
  #
  #
  # private
  #
  # def connection
  #   Faraday.new(url: "http://localhost:3000") do |f|
  #     f.adapter Faraday.default_adapter
  #   end
  # end
  #
  # def get_json(url)
  #   JSON.parse(connection.get(url).body, symbolize_names: true)
  # end
end