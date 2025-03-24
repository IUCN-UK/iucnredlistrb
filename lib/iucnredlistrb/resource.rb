# frozen_string_literal: true

module IUCNRedListRb
  # IUCNRedListRb::Resource
  #
  class Resource
    def initialize(client, endpoint)
      @client = client
      @endpoint = endpoint
    end

    def list
      @client.get(@endpoint)
    end

    def find(id, query = {})
      @client.get("#{@endpoint}/#{id}", query)
    end
  end
end
