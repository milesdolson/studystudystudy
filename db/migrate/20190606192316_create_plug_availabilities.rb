class CreatePlugAvailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :plug_availabilities do |t|
      t.string :availability

      t.timestamps
    end
  end
end
