class CreateBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :bookmarks do |t|
      t.integer :study_location_id
      t.integer :category_id

      t.timestamps
    end
  end
end
