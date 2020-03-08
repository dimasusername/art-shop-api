# frozen_string_literal: true

module PaintingsRepresenter
  include Roar::JSON::HAL
  include Roar::Hypermedia
  include Grape::Roar::Representer

  link :self do |_opts|
    '/paintings'
  end

  collection(
    :entries,
    extend: PaintingRepresenter,
    as: :paintings
    # embedded: true
  )

  property(:count)
end
