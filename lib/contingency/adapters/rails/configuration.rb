module Contingency

  module Adapters
    module Rails
      def default_configuration

        config.error_layout = 'application'
        config.error_template = 'errors/error'

        ###
        # A hash of errors mapped to status codes.
        # `ActiveSupport::Rescuable#rescue_from` will catch these
        # and pass them to `Contingency::ErrorHandler`.
        # Ensure that your general case exception comes first in the list,
        # otherwise it will catch everything. Not sure why, I think it's
        # something about `ActiveSupport::Rescuable#rescue_from`.

        config.errors = {
          500.to_s => [ Exception ],
          404.to_s => [
            ActiveRecord::RecordNotFound,
            ActionController::UnknownController,
            AbstractController::ActionNotFound,
            ActionController::RoutingError,
          ],
        }

        ###
        # A hash of error reports mapped to status codes.
        # This should be under I18N and L10N instead of here, really.
        # Takes an array of an error message and a description.
        #
        config.error_messages = {
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

      end
    end
  end

end
