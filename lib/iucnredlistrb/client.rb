module IUCNRedListRb
  class Client
    API_BASE = "https://api.iucnredlist.org/"

    def initialize
      @connection = initialize_connection
    end

    def get(endpoint, query = {})
      response = @connection.get(endpoint, query)

      if response.success?
        response.body
      else
        "Error! Status: #{response.status} #{response.body}"
      end
    end

    private

    def initialize_connection
      Faraday.new(url: API_BASE) do |connection|
        connection.response :json
      end
    end
  end
end