class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :currency
      t.string :currency_code
      t.text :description
      t.boolean :visited, default: false
      t.datetime :visit_from
      t.datetime :visit_to
      
      t.timestamps
    end
  end
end
