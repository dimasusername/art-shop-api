# frozen_string_literal: true

module MyPurchaseRepresenter
  include Roar::JSON
  include Roar::Hypermedia
  include Grape::Roar::Representer
  include Grape::Roar::Extensions::Relations

  link :self do |_opts|
    "/me/purchases/#{_id}"
  end

  property(:_id)
  property(:created_at)
  property(:painting)
end
