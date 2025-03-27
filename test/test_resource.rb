# frozen_string_literal: true

require "minitest/autorun"
require "net/http"
require "json"
require "webmock/minitest"

module IUCNRedListRb
  class ResourceTest < Minitest::Test
    def setup
      @client = Client.new(api_key: "RED_LIST_API_KEY")
    end

    def test_all
      Client::RESOURCE_NAMES.each do |endpoint|
        response_body = { "status" => "ok" }

        stub_request(:get, "https://api.iucnredlist.org/api/v4/#{endpoint}")
          .to_return(status: 200, body: response_body.to_json, headers: { "Content-Type" => "application/json" })

        response = @client.send(endpoint).list
        assert_equal response_body, response
      end
    end

    def test_find
      Client::RESOURCE_NAMES.each do |endpoint|
        response_body = { "status" => "ok" }

        stub_request(:get, "https://api.iucnredlist.org/api/v4/#{endpoint}/1_1?latest=true&scope=1")
          .to_return(status: 200, body: response_body.to_json, headers: { "Content-Type" => "application/json" })

        response = @client.send(endpoint).find("1_1", latest: true, scope: 1)
        assert_equal response_body, response
      end
    end
  end
end
