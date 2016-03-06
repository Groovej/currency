require 'spec_helper'

describe 'Home page' do
  let!(:default_country1) { create :default_counrty }
  let!(:default_country2) { create :default_counrty }
  let!(:visited_country)  { create :visited_country }

  before(:each) do
    visit root_path
  end

  it 'should contain basic content' do
    expect(page).to have_content 'Hello Mr.Smart'
    expect(page).to have_css('#currencies_select')
    expect(page).to have_content('Currency Country is')
    expect(page).to have_no_content('Empty')
  end

  it 'can see all countries' do
    click_link('All countries')
    within('table#mytable') do
      expect(page).to have_xpath(".//tr", count: 4)
    end
  end

  it 'can see all visited countries' do
    click_link('Visited countries')
    within('table#mytable') do
      expect(page).to have_xpath(".//tr", count: 2)
    end
  end

  it "can see all remaining countries" do
    click_link('Remaining countries')
    within('table#mytable') do
      expect(page).to have_xpath(".//tr", count: 3)
    end
  end

  it "can add new country to visited", js: true do
    FactoryGirl.create :my_country
    within('form') do
      find(:css, 'input.inputs').set('Hri')
      find(:css, 'select#currencies_select').find(:option, 'Hrivha - HRN').select_option
      click_button 'Mark as visited'
    end
    within('form') do
      check('Mark as visited')
    end
    expect{click_button('Add to visited...', exact: true)}.to change{Country.visited.size}.from(1).to(2)
  end
end
