module Imagga
  module Categorization
    module Configuration
      VALID_CONNECTION_KEYS = [:endpoint, :user_agent].freeze
      VALID_OPTIONS_KEYS    = [:api_key].freeze
      VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS

      DEFAULT_ENDPOINT      = 'http://api.imagga.com/'
      DEFAULT_USER_AGENT    = "Imagga Categorization API ruby Gem #{Categorization::VERSION}".freeze

      DEFAULT_APP_KEY       = nil

      attr_accessor *VALID_CONFIG_KEYS

      # Make sure we have the default values set when we get 'extended'
      def self.extended(base)
        base.reset
      end

      def reset
        self.endpoint   = DEFAULT_ENDPOINT
        self.user_agent = DEFAULT_USER_AGENT

        self.api_key    = DEFAULT_APP_KEY
      end

      def configure
        yield self
      end

      def options
        Hash[ * VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
      end

    end
  end
end