module ShiprocketAPI
  class ReturnOrderCollection < ActiveResource::Collection
    def initialize(args)
      @per_page = args.dig('meta', 'pagination', 'per_page')
      @next_url = args.dig('meta', 'pagination', 'links', 'next')
      @previous_url = args.dig('meta', 'pagination', 'links', 'previous')
      super(args['data'])
    end

    def previous_page?
      previous_url.present?
    end

    def next_page?
      next_url.present?
    end

    def fetch_next_page
      fetch_page(next_url)
    end

    def fetch_previous_page
      fetch_page(previous_url)
    end

    private

    def fetch_page(url)
      return [] unless url.present?

      resource_class.all(from: url + "&per_page=#{per_page}")
    end

    attr_reader :per_page, :next_url, :previous_url
  end
end
