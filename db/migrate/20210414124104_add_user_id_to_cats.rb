# frozen_string_literal: true

class AddUserIdToCats < ActiveRecord::Migration[6.0]
  def change
    add_reference :cats, :user, null: false, foreign_key: true
  end
end
