class CreateCurrencyTypes < ActiveRecord::Migration
  def change
    create_table :currency_types do |t|
      t.integer :country_id
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
