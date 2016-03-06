class Country < ActiveRecord::Base
  # attr_accessor :name, :currency, :currencyCode
  has_many :currencytypes

	validates_uniqueness_of :name, message: " --  You had this country at the list, add another name."

  scope :visited, -> { where(visited: true) }
  scope :remaining, -> { where(visited: false) }
end
