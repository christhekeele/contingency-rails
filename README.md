<a name='contingency-rails-readme'>
# Contingency-Rails
</a>

> "Freedom is the recognition of contingency."

>   * *Richard M. Rorty*

Contingency-Rails provides [Contingency](https://github.com/christhekeele/contingency) integration for [Rails](http://rubyonrails.org/).

<a name='table-of-contents'>
## Table of Contents
</a>

* [Installation](#installation)
* [Configuration](#configuration)
* [Extra Routes](#extra-routes)
    * [Error Codes](#error-codes)
    * [Catch-all Routes](#catch-alls)
* [Contributing to Contingency-Rails](#contributing-to-contingency-rails)

<a name='installation'>
## Installation
</a>

Add this line to your application's Gemfile:

    gem 'contingency-rails', '~> 3.0'

Then, execute:

    $ bundle

Finally, add this to your `ApplicationController`:

    include Contingency::Plan

<a name='configuration'>
## Configuration
</a>

Contingency-Rails uses the same configuration object as Contingency, but has different defaults. Run 'rake contingency:generate:rails:config' to get the example initializer. If you decide to skip this step, make sure you call `Contingency.configure` *somewhere* in your boot process, and that you have a view called `error` at `app/views/errors/`.

<a name='extra-routes)'>
## Extra Routes
</a>

Once you've configured your errors, you can get some additional features out of Contingency by adding a few routes to your `routes.rb`

<a name='error-codes)'>
### Error Codes
</a>

At the bottom of your routes, add this line:

    match "/:code", to: 'application#error', as: :error, constraints: {code: /\d{3}/}

This controller action allows you to access your custom error pages directly. This means in development mode you won't have to change `config.consider_all_requests_local` to true and intentionally raise an error in one of your controllers just to see if your two lines of CSS improved the feel of your error page.

<a name='catch-alls)'>
### Catch-all Routes
</a>

At the **VERY** bottom of your routes, add this line:

    match '/*invalid_url', to: 'application#routing_error'

This Rails-specific controller action enables Contingency to catch `ActionController::RoutingError` exceptions. Normally, invalid URLs in Rails are handled by Rack, so the Contingency Plan living in your controller can't rescue from it. Append this globbed route to the very end of your routes, and it can.

<a name='contributing-to-contingency-rails'>
## Contributing to Contingency
</a>

1. Fork it
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create new Pull Request
