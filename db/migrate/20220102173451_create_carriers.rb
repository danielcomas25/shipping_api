class CreateCarriers < ActiveRecord::Migration[5.0]
  def change
    create_table :carriers do |t|
      t.string :code
      t.integer :delivery_promise
      t.boolean :saturday_deliveries
      t.integer :oversea_delay_threshold

      t.timestamps
    end
  end
end
