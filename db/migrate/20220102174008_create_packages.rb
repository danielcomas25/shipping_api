class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.references :carrier, foreign_key: true
      t.date :shipping_date
      t.string :origin_country
      t.string :destination_country

      t.timestamps
    end
  end
end
