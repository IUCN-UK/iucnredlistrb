# frozen_string_literal: true

module IUCNRedListRb
  # For detailed API documentation, visit:
  # https://api.iucnredlist.org/api-docs/index.html
  class Endpoint
    attr_reader :client, :endpoint

    def initialize(client, endpoint)
      @client = client
      @endpoint = endpoint
    end

    def all
      client.get(endpoint)
    end

    def find_by(query)
    end
  end
end