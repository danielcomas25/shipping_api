class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.references :package, foreign_key: true
      t.date :expected_delivery
      t.integer :oversea_delay

      t.timestamps
    end
  end
end
