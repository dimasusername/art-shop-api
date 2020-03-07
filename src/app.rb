# frozen_string_literal: true

# application
class App < Grape::API
  version('v1', using: :accept_version_header)
  format(:json)
end
