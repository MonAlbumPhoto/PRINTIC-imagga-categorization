require "httparty"

module Imagga
  module Categorization
    class Client
      include HTTParty

      # Define the same set of accessors as the Categorization module
      attr_accessor *Configuration::VALID_CONFIG_KEYS

      def initialize(options={})
        # Merge the config values from the module and those passed
        # to the client.
        merged_options = Categorization.options.merge(options)

        # Copy the merged values to this client and ignore those
        # not part of our configuration
        Configuration::VALID_CONFIG_KEYS.each do |key|
          send("#{key}=", merged_options[key])
        end

        # set the endpoint for HTTParty
        self.class.base_uri self.endpoint.to_s

        # set a default api_key parameter for each HTTParty request
        @options = {
          query: { api_key: self.api_key }
        }
      end

      def classify(classifier_id, options={})
        default_options = { async: 1 }
        options.merge!(default_options)
        options = @options.merge({ body: options.to_query })
        self.class.post "/draft/classify/#{classifier_id}", options
      end

      def classify_result(ticket_id)
        self.class.get "/draft/classify/result/#{ticket_id}", @options
      end

      def task_result(task_id)
        self.class.get "/draft/tasks/#{task_id}", @options
      end
    end
  end
end