# frozen_string_literal: true

module MyPurchasesRepresenter
  include Roar::JSON::HAL
  include Roar::Hypermedia
  include Grape::Roar::Representer

  link :self do |_opts|
    '/me/purchases'
  end

  collection(
    :entries,
    extend: MyPurchaseRepresenter,
    as: :purchases
  )

  property(:count)
end
