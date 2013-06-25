require 'contingency'

module Contingency

  module Adapters
    module Rails

      include Interface

      module ClassMethods
        def catch_errors?
          !::Rails.application.config.action_dispatch.show_exceptions or !::Rails.application.config.consider_all_requests_local
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end

      def error_renderer(code)
        render Contingency.configuration.error_template,
                status: code,
                layout: Contingency.configuration.error_layout
      end

      def failure_renderer(code)
        render status: code, text: Contingency.configuration.failure_message
      end

      # Custom controller action.
      # Raises traditional Rack-level Rails RoutingError at Application-level instead,
      # so it `rescue_from` in Contingency's error handler can catch it instead of Rack's.
      # Works in conjunction with a catchall route pointed at this controller action.
      def routing_error
      require 'pry'; binding.pry
        raise ActionController::RoutingError, "No route matches [#{env['REQUEST_METHOD']}] #{env['PATH_INFO'].inspect}"
      end

    end
  end
end

require 'contingency/rails/configuration'
require 'contingency/rails/railtie'
require "contingency/rails/version"
