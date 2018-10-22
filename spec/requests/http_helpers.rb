module HTTPHelpers
  def base_url
    ENV["BATTLESHIFT_BASE_URL"] || "http://localhost:3000"
  end

  def conn
    @conn ||= Faraday.new(base_url) do |faraday|
      faraday.headers["X-API-Key"] = ENV["BATTLESHIFT_API_KEY"]
      faraday.adapter  Faraday.default_adapter
    end
  end

  def post_json(endpoint, payload, api_key = ENV["BATTLESHIFT_API_KEY"])
    request = conn.post do |req|
      req.url endpoint
      req.headers["X-API-Key"] = api_key
      req.headers["CONTENT_TYPE"] = "application/json"
      req.body = payload
    end
  end
