class CreateStudyLocationDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :study_location_details do |t|
      t.integer :ambience_id
      t.integer :noise_level_id
      t.integer :internet_quality_id
      t.integer :plug_availability_id
      t.integer :location_id
      t.integer :user_id

      t.timestamps
    end
  end
end
