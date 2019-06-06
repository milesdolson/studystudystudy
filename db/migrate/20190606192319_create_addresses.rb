class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :street_number
      t.string :street
      t.string :city
      t.integer :postal_code
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
