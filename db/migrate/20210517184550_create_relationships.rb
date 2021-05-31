class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :cat, foreign_key: true

      t.timestamps

      t.index %i[user_id cat_id], unique: true
    end
  end
end
