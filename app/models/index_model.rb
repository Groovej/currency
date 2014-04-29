class IndexModel
	require 'nokogiri'

	attr_reader :country_name, :country_code, :currency

	def initialize(currency) 
		connection = Savon.client(wsdl: 'http://www.webservicex.net/country.asmx?WSDL')
		#connection.opperations gives you  list of opeartions [array]
		response = connection.call(:get_currencies)
		data = response.to_hash[:get_currencies_response][:get_currencies_result]
		@country

	end
end