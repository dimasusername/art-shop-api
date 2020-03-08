# frozen_string_literal: true

module PaintingRepresenter
  include Roar::JSON
  include Roar::Hypermedia
  include Grape::Roar::Representer

  link :self do |_opts|
    "/paintings/#{_id}"
  end

  property(:_id)
  property(:name)
  property(:price)
  property(:sold_out)
end
