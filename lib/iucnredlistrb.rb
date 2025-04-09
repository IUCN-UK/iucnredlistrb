# frozen_string_literal: true

require "net/http"
require "faraday"
require "json"

require_relative "iucnredlistrb/assessment"
require_relative "iucnredlistrb/client"
require_relative "iucnredlistrb/resource"
require_relative "iucnredlistrb/taxa"
require_relative "iucnredlistrb/version"

module IUCNRedListRb
  class Error < StandardError; end
end
