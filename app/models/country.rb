class Country < ActiveRecord::Base
  has_many :currency_types

  scope :visited, -> { where(visited: true) }
  scope :remaining, -> { where(visited: false) }
end
