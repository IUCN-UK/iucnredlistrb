# frozen_string_literal: true

module IUCNRedListRb
  class Assessment
    def initialize(client)
      @client = client
    end

    def find(id)
      @client.get("assessment/#{id}")
    end
  end
end
