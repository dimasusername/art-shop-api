# frozen_string_literal: true

module MeRepresenter
  include Roar::JSON
  include Roar::Hypermedia
  include Grape::Roar::Representer

  link :self do |_opts|
    '/me'
  end

  link :purchases do |_opts|
    '/me/purchases'
  end

  property(:_id)
  property(:name)
  property(:balance)
end
