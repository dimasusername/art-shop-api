# frozen_string_literal: true

require 'rubygems'
require 'bundler'

ENVIRONMENT = ENV.fetch('RACK_ENV', 'development').to_sym
Bundler.require(:default, ENVIRONMENT)

# Global Configuration
BigDecimal.mode(BigDecimal::ROUND_MODE, BigDecimal::ROUND_HALF_EVEN)
ROUND_LIMIT = 2

# default options to `declared` provided by Grape::API
DECLARED_OPTIONS =
  { include_parent_namespaces: false, include_missing: false }.freeze

# https://github.com/rails-api/active_model_serializers/issues/354
module BSON
  # BSON::ObjectId
  class ObjectId
    def as_json(*)
      to_s
    end
  end
end

APP_ROOT = File.expand_path('../', File.dirname(__FILE__))

model_files = File.join(APP_ROOT, %w[models ** *.rb])
files = [
  model_files
]
Dir.glob(files).sort.each { |lf| require lf }

# Main
require "#{APP_ROOT}/app"

# Controllers
CONTROLLERS_ROOT = File.join(APP_ROOT, 'controllers')

# Base
require "#{CONTROLLERS_ROOT}/controller.rb"

# API

# Projects
