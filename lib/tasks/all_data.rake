namespace :db do
  desc "Fetch all data for application"
  task populate: :environment do
    load("db/populate.rb")
  end
end
