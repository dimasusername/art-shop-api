# frozen_string_literal: true

# application
class App < Grape::API
  version('v1', using: :accept_version_header)
  format(:json)
  formatter :json, Grape::Formatter::Roar

  Grape.configure do |_config|
    Mongoid.load!('config/mongoid.yml', ENV['RACK_ENV'])
  end
end
