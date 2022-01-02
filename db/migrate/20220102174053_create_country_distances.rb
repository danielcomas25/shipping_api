class CreateCountryDistances < ActiveRecord::Migration[5.0]
  def change
    create_table :country_distances do |t|
      t.string :country
      t.text :distance

      t.timestamps
    end
  end
end
