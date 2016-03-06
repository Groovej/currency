describe SavonWraper do
  let(:response) { {:get_currencies_response=>
  {:get_currencies_result=>
    "<NewDataSet>\n  <Table>\n    <Name>Afghanistan, Islamic State of</Name>\n    <CountryCode>af</CountryCode>\n    <Currency>Afghani</Currency>\n    <CurrencyCode>AFA</CurrencyCode>\n  </Table>\n  <Table>\n    <Name>Albania</Name>\n    <CountryCode>al</CountryCode>\n    <Currency>Lek</Currency>\n    <CurrencyCode>ALL</CurrencyCode>\n  </Table>\n  <Table>\n    <Name>Algeria</Name>\n    <CountryCode>dz</CountryCode>\n    <Currency>Dinar</Currency>\n    <CurrencyCode>DZD</CurrencyCode>\n  </Table>\n  <Table>\n    <Name>American Samoa</Name>\n    <CountryCode>as</CountryCode>\n    <Currency />\n    <CurrencyCode />\n  </Table>\n  </NewDataSet>" } }}
  let(:savon) { SavonWraper.instance }

  it "#clear data" do
    result = savon.send(:clear_data, response)
    expect(result).to be_an_instance_of Array
    expected_result = {"Name"=>"Afghanistan, Islamic State of","Currency"=>"Afghani","CurrencyCode"=>"AFA"}
    expect(result.first).to eql expected_result
  end

  it "#update_datatable" do
    expect { savon.send(:update_datatable, response)}.to change{ Country.all.size }.from(0).to(3)
  end
end
