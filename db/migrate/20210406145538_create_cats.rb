# frozen_string_literal: true

class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string   :cat_name, null: false
      t.integer  :cat_sex_id
      t.integer  :cat_age
      t.integer  :cat_breed_id
      t.timestamps
    end
  end
end
