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
    API_BASE = "https://api.iucnredlist.org/api/v4/"

    RESOURCE_NAMES = ['biogeographical_realms', 'comprehensive_groups']

    def initialize(api_key:)
      @connection = initialize_connection_with(api_key:)
    end

    RESOURCE_NAMES.each do |resource_name|
      instance_variable_get("@#{resource_name}") ||
        instance_variable_set(
          "@#{resource_name}", IUCNRedListRb::Endpoint.new(self, resource_name)
        )
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

    def initialize_connection(api_key:)
      Faraday.new(url: API_BASE) do |connection|
        connection.headers['accept'] = '*/*'
        connection.headers['Authorization'] = api_key
        connection.response :json
      end
    end
  end
end
