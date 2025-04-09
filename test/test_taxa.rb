require "minitest/autorun"

module IUCNRedListRb
  class TaxaTest < Minitest::Test
    def setup
      @client = Client.new(api_key: "RED_LIST_API_KEY")
    end

    def test_taxa_levels_methods
      Taxa::TAXA_LEVELS.each do |taxa_level|
        assert_instance_of IUCNRedListRb::Resource, @client.taxa.send(taxa_level)
      end
    end
  end
end
