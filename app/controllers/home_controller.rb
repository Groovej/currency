class HomeController < ApplicationController
  require 'nokogiri'

  def index
  	 #  	my_data= [
	# 	{"currency" => 'Dollar', "country" => "USA", "back" => true, "lost"=> 22},
	# 	{"currency" => 'Tre', "country" => "Uganda", "back" => true, "lost"=> 22},
	# 	{"currency" => 'Hrivna', "country" => "Ukraine", "back" => true, "lost"=> 22},
	# 	{"currency" => 'Euro', "country" => "France", "back" => true, "lost"=> 22},
	# 	{"currency" => 'Lari', "country" => "Georgia", "back" => true, "lost"=> 52},
	# 	{"currency" => 'regt', "country" => "re", "back" => true, "lost"=> 22},
	# 	{"currency" => 'reds', "country" => "Cannada", "back" => true, "lost"=> 28},
	# 	{"currency" => 'Pounds', "country" => "England", "back" => true, "lost"=> 24},
	# 	{"currency" => 'Dollarwq', "country" => "Polland", "back" => true, "lost"=> 22},
	# 	{"currency" => 'Dollarius', "country" => "U", "back" => true, "lost"=> 522}
	# ]
  end

  def list
  	connection = Savon.client(wsdl: 'http://www.webservicex.net/country.asmx?WSDL', raise_errors: false, open_timeout: 5, read_timeout: 5, pretty_print_xml: true)
	#connection.operations gives you  list of opeartions [array]
	response = connection.call(:get_currencies)
	if response.success?
		xml_string_data = response.to_hash[:get_currencies_response][:get_currencies_result]
		fetching_data = Hash.from_xml(xml_string_data)
		my_data = fetching_data["NewDataSet"]["Table"]
		s_data = my_data.each{|item| item.delete_if{|key, value| ["CountryCode"].include? key} }
		@data = s_data.reject!{|item| !item["Currency"]}
		flash[:notice] = "Data fetching from server successfull."
		render :json => @data.to_json
	else 
		render nothing: true
		flash[:error] = "Sorry, data wasn't fetching from server."
  	end
  end

end
