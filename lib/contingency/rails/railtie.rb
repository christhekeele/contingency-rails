module Contingency
  module Adapters
    module Rails
      class Railtie < ::Rails::Railtie
        initializer "contingency.plan" do

          # Not defined at initializer runtime
          # ApplicationController.send(:include, Contingency::Plan) if defined?(ApplicationController)

          # Doesn't pass on our methods to ApplicationController when it subclasses ActionController::Base
          # ActionController::Base.send(:include, Contingency::Plan) if defined?(ActionController::Base)

        end
      end
    end
  end
end
