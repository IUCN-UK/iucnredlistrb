# frozen_string_literal: true

require "net/http"
require "faraday"
require "json"

require_relative "iucnredlistrb/version"
require_relative "iucnredlistrb/client"
require_relative "iucnredlistrb/endpoint"

module IUCNRedListRb
  class Error < StandardError; end
end
