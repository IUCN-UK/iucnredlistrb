# frozen_string_literal: true

module IUCNRedListRb
  class Resource
    def initialize(client, endpoint)
      @client = client
      @endpoint = endpoint
    end

    def list
      @client.get(@endpoint)
    end

    def find(id, query = {})
      @client.get("#{@endpoint}/#{id}", query)
    end

    def all(id, query = {}, show_progress: false, wait_time: 0.5)
      all_responses = find(id, query)
      total_pages = all_responses["total-pages"].to_i

      return all_responses if total_pages == 1

      (2..total_pages).each do |page|
        show_progress_for(page, total_pages) if show_progress

        sleep wait_time
        paged_response = find(id, query.merge(page: page))
        all_responses["assessments"] += paged_response["assessments"]
      end

      all_responses
    end

    private

    def show_progress_for(page, total_pages)
      percent = (page / total_pages.to_f) * 100
      bar_length = 30
      filled_length = (percent / (100.0 / bar_length)).round
      bar = "█" * filled_length + "-" * (bar_length - filled_length)

      print "\r[#{bar}] #{percent.round(1).clamp(0..100)}% Complete  "
    end
  end
end
