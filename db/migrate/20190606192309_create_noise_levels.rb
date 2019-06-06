class CreateNoiseLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :noise_levels do |t|
      t.float :level

      t.timestamps
    end
  end
end
