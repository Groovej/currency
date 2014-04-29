class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :currency
      t.text :description
      t.datetime :visit_from
      t.datetime :visit_to
      
      t.timestamps
    end
  end
end
