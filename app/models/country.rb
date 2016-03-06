class Country < ActiveRecord::Base
  has_many :currency_types

	validates_uniqueness_of :name

  scope :visited, -> { where(visited: true) }
  scope :remaining, -> { where(visited: false) }
end
