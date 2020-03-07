# frozen_string_literal: true

environment(ENV['RACK_ENV'] || 'development')

on_worker_boot do
  Mongoid.load!('config/mongoid.yml', ENV['RACK_ENV'])
end
