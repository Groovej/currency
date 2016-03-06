class SavonWraper
  include Singleton

  def self.give_me_data
    new.data
  end

  def initialize
    @connection = Savon.client(wsdl: 'http://www.webservicex.net/country.asmx?WSDL', raise_errors: false, open_timeout: 5, read_timeout: 5, pretty_print_xml: true)
  end

  def data
    response = get_response
    if response.success?
      update_datatable(response)
    end
  end

  private

  def get_response
    @connection.call(:get_currencies)
  end

  def update_datatable(response)
    data = clear_data(response)
    data.each do |row|
      Country.find_or_create_by(row.transform_keys{|key| key.underscore})
    end
  end

  def clear_data(response)
    xml_string_data = response.to_hash[:get_currencies_response][:get_currencies_result]
    fetching_data = Hash.from_xml(xml_string_data)
    my_data = fetching_data["NewDataSet"]["Table"]
    s_data = my_data.each{|item| item.delete_if{|key, value| ["CountryCode"].include? key} }
    s_data.reject!{|item| !item["Currency"]}
  end
end
