module Square
  class ListResponse < Array
    attr_accessor :response

    # RegExp used for parsing Link headers when the API paginates data. Don't
    # care about rel attributes right now because this is the only thing this is
    # used for.
    LINK_REGEXP = /^<([ -~]+)>;/i

    # Initialize.
    #
    # @param response [RestClient::Response]
    # @param data_type [Square::DataType] Data type to new up records.
    #
    # @return [self] with parsed records.
    def initialize(response, data_type)
      @response = response
      @data_type = data_type
      super(parse_response)
    end

    # Parse the response.
    #
    # @return [Array, Hash] Parsed response.
    def parse
      begin
        ::JSON.parse(@response)
      rescue ::Exception => e
        ap e.message
        e
      end
    end

    # Get more records.
    #
    # @return [Array] parsed records.
    def more
      if !has_more?
        return nil
      end

      @response = Square.make_request(url: @next_link)
      parse_response
    end

    # Check if there are more pages.
    #
    # @return [Boolean]
    def has_more?
      !@next_link.nil?
    end

    private

    # Pass through methods to the original response object.
    def method_missing(name, *args, &block)
      @response.send(name, *args, &block)
    end

    # Parse a response.
    #
    # @return [Array] parsed records.
    def parse_response
      # Detect a Link header.
      if @response.headers[:link].present?
        match = LINK_REGEXP.match(@response.headers[:link])
        @next_link = match.captures[0]
      else
        @next_link = nil
      end

      parsed_response = JSON.parse(@response)
      parsed_response.map {|record| @data_type.new(record)}
    end
  end
end
