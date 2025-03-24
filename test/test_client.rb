# frozen_string_literal: true

require "minitest/autorun"
require "net/http"
require "json"
# require "webmock/minitest"

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
  class ClientTest < Minitest::Test
    def setup
      @client = Client.new
    end

    def test_initialize
      assert_instance_of IUCNRedListRb::Client, @client
    end
  end
end
