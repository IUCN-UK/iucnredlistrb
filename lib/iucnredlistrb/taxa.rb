# frozen_string_literal: true

module IUCNRedListRb
  class Taxa
    def initialize(client)
      @client = client
    end

    TAXA_LEVELS = %w[
      kingdom
      phylum
      class
      order
      family
    ].freeze

    TAXA_LEVELS.each do |taxa_level|
      define_method(taxa_level) do
        instance_variable_get("@#{taxa_level}") ||
          instance_variable_set(
            "@#{taxa_level}", IUCNRedListRb::Resource.new(@client, "taxa/#{taxa_level}")
          )
      end
    end
  end
end
