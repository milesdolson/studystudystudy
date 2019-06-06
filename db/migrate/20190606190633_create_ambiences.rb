class CreateAmbiences < ActiveRecord::Migration[5.1]
  def change
    create_table :ambiences do |t|
      t.string :description

      t.timestamps
    end
  end
end
