class CreateProyotypes < ActiveRecord::Migration[7.0]
  def change
    create_table :proyotypes do |t|
      t.string  :title, null: false
      t.text :catch_copy, null: false
      t.text :concept, null: false
     

      t.timestamps
    end
  end
end
