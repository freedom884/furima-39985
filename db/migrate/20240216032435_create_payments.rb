class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :price  ,null: false

      t.timestamps
    end
  end
end
