class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name              ,null: false
      t.text    :description      ,null: false
      t.integer :category_id      ,null: false 
      t.integer :condition_id     ,null: false 
      t.integer :shippingfee_id  ,null: false
      t.integer :prefecture_id   ,null: false
      t.integer :scheduleddelivery_id ,null: false
      t.references :user,          null: false, foreign_key: true 
      t.integer :price            , null: false    


      t.timestamps
    end
  end
end
