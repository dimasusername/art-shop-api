# frozen_string_literal: true

require 'rack-timeout'
use Rack::Timeout, service_timeout: ENV.fetch('WEB_TIMEOUT', 900)

require './config/boot'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: %i[get options put patch post delete]
  end
end

run Rack::Cascade.new(
  [
    Controller,
    PaintingsController,
    MeController
  ]
)
