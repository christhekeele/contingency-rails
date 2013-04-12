module Contingency

  module Adapters
    module Rails
      class Configuration < Contingency::Configuration

        def initialize
          @errors = {
              500.to_s => [ Exception ],
              404.to_s => [
                ActiveRecord::RecordNotFound,
                ActionController::UnknownController,
                AbstractController::ActionNotFound,
                ActionController::RoutingError,
              ],
            }

          @error_messages = {
              401.to_s => [
                'Unauthorized',
                'You should log in before you try that!'
              ],
              403.to_s => [
                'Forbidden',
                'You don\'t have permission to do that.'
              ],
              404.to_s => [
                'Not Found',
                'You may have mistyped the address or the page may have moved.'
              ],
              405.to_s => [
                'Method Not Allowed',
                'You may be trying to access our API with an invalid request method.'
              ],
              406.to_s => [
                'Not Acceptable',
                'You may be trying to access our API with invalid request headers.'
              ],
              500.to_s => [
                'Internal Server Error',
                'It looks like something went wrong. Don\'t worry, we\'re on it!'
              ],
              503.to_s => [
                'Service Unavailable',
                'We\'re down for maintainence right now.'
              ],
            }

          @error_layout = 'application'
          @error_template = 'errors/error'

          @unknown_error_message = ['Server Error', 'It looks like something went wrong.']
          @failure_message =  "Server Error: It looks like something went wrong."

          @logger = ::Rails.logger
        end

      end
    end
  end

end
