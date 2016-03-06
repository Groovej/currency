FactoryGirl.define do
  factory :default_counrty, class: Country do
    name { Faker::Address.country }
    currency { Faker::Lorem.word }
    currency_code { (0..2).map { ('A'..'Z').to_a[rand(26)] }.join }
    visited false
  end

  factory :new_default_country, parent: :default_counrty do
    description { Faker::Lorem.sentence(3, true) }
    visit_from { Time.zone.now }
    visit_to { Time.zone.now + 22.days }
  end

  factory :visited_country, parent: :new_default_country do
    name 'USA'
    visited true
  end

  factory :my_country, parent: :default_counrty do
    name 'Ukraine'
    currency 'Hrivha'
    currency_code 'HRN'
  end

end
