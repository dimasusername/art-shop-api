# frozen_string_literal: true

class Painting
  include Mongoid::Document

  field(:name, type: String)
  field(:price, type: Integer)
  has_one(:purchase)

  def sold_out
    !purchase.nil?
  end

  validates_uniqueness_of(:name)

  # Implement a custom param type for Grape
  def self.parse(id)
    find(id)
  end
end
