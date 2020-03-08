# frozen_string_literal: true

class Customer
  include Mongoid::Document

  field(:name, type: String)
  field(:balance, type: Integer)
  has_many(
    :purchases,
    dependent: :restrict_with_exception
  )
end
