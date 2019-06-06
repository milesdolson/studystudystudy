class CreateInternetQualities < ActiveRecord::Migration[5.1]
  def change
    create_table :internet_qualities do |t|
      t.float :quality

      t.timestamps
    end
  end
end
