class BattleShiftService
  attr_reader :conn
  def initialize(filter = {})
    @filter = filter
    @conn = Faraday.new(url: ENV["base_url"]) do |faraday|
      faraday.request :url_encoded
      #faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end
  end

  def access_api
    Faraday.new(url: ENV["base_url"])
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def fetch_users_data
    get_url("/api/v1/users")
  end

  # def self.fetch_users_data
  #   new.fetch_users_data
  # end

  def fetch_one_user_data
    get_url("/api/v1/users/#{@filter}")
  end

  # def self.fetch_one_user_data
  #   new.fetch_one_user_data
  # end

  # def self.update_user
  #   new.patch("/api/v1/users/#{@filter}")
  # end
end
