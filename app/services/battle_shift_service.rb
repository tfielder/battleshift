class BattleShiftService
  attr_reader :conn
  def initialize(filter)
    @filter = filter
    # @conn = Faraday.new(url: "https://young-tundra-64543.herokuapp.com") do |faraday|
    @conn = Faraday.new(url: "https://young-tundra-64543.herokuapp.com/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def access_api
    Faraday.new(url: "https://young-tundra-64543.herokuapp.com/")
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def fetch_users_data
    get_url("/api/v1/users")
  end

  def self.fetch_users_data
    new.fetch_users_data
  end

  def fetch_one_user_data
    get_url("/api/v1/users/#{@filter}")
  end

  def self.fetch_one_user_data
    new.fetch_one_user_data
  end

  def self.update_user
    new.patch("/api/v1/users/#{@filter}")
  end
end
