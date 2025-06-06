# frozen_string_literal: true

require "minitest/autorun"
require "net/http"
require "json"
# require "webmock/minitest"

module IUCNRedListRb
  class ClientTest < Minitest::Test
    def setup
      @client = Client.new(api_key: "a_red_list_api_authorisation_key")
    end

    def test_initialize
      assert_instance_of IUCNRedListRb::Client, @client
    end
  end
end
