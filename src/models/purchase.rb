# frozen_string_literal: true

class Purchase
  include Mongoid::Document
  include Mongoid::Timestamps::Created

  belongs_to(:customer)
  belongs_to(:painting)
end
