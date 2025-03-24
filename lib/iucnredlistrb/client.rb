# frozen_string_literal: true

module IUCNRedListRb
  # IUCNRedListRb::Client
  #
  # This class serves as the main entry point for interacting with the IUCN Red List API.  It delegates to
  # the IUCNRedListRb classes to provide access to the various endpoints available in the Red List API.
  #
  # For detailed API documentation, visit:
  # https://api.iucnredlist.org/api-docs/index.html
  #
  # Example usage:
  #
  #   client = IUCNRedListRb::Client.new
  #
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
