# frozen_string_literal: true

module IUCNRedListRb
  class Client
    API_BASE = "https://api.iucnredlist.org/api/v4/"

    RESOURCE_NAMES = %w[
      biogeographical_realms
      comprehensive_groups
      conservation_actions
      countries
      faos
      growth_forms
      habitats
      population_trends
      red_list_categories
      research
      scopes
      stresses
      systems
      threats
      use_and_trade
    ].freeze

    def initialize(api_key:)
      @connection = initialize_connection_with(api_key: api_key)
    end

    def assessment
      @assessment ||= IUCNRedListRb::Assessment.new(self)
    end

    def taxa
      @taxa ||= IUCNRedListRb::Taxa.new(self)
    end

    RESOURCE_NAMES.each do |resource_name|
      define_method(resource_name) do
        instance_variable_get("@#{resource_name}") ||
          instance_variable_set(
            "@#{resource_name}", IUCNRedListRb::Resource.new(self, resource_name)
          )
      end
    end

    def get(endpoint, query = {})
      response = @connection.get(endpoint, query)

      if response.success?
        selected_headers = response.headers.select do |key, _|
          %w[total-count total-pages current-page page-items].include?(key)
        end

        response.body.merge(selected_headers)
      else
        "Error! Status: #{response.status} #{response.body}"
      end
    end

    private

    def initialize_connection_with(api_key:)
      Faraday.new(url: API_BASE) do |connection|
        connection.headers["accept"] = "*/*"
        connection.headers["Authorization"] = api_key
        connection.response :json
      end
    end
  end
end
