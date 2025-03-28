# frozen_string_literal: true

require "minitest/autorun"
require "net/http"
require "json"
require "webmock/minitest"

module IUCNRedListRb
  class AssessmentTest < Minitest::Test
    def setup
      @client = Client.new(api_key: "RED_LIST_API_KEY")
    end

    def test_find
      response_body = { "status" => "ok" }

      stub_request(:get, "https://api.iucnredlist.org/api/v4/assessment/12345")
        .to_return(status: 200, body: response_body.to_json, headers: { "Content-Type" => "application/json" })

      response = @client.assessment.find(12_345)
      assert_equal response_body, response
    end
  end
end
