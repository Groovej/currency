class Country < ActiveRecord::Base
	has_many :currencytypes

	validates_uniqueness_of :name, :message => " --  You had this country at the list, add another name."
end