class CreateCatPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :cat_photos do |t|
      t.references :cat, null: false, foreign_key: true
      t.references :photo, null: false, foreign_key: true
      t.timestamps
    end
  end
end
