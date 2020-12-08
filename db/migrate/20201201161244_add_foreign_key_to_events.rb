# frozen_string_literal: true

# rubocop:todo Style/Documentation
class AddForeignKeyToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :user, foreign_key: true
  end
end
# rubocop:enable Style/Documentation
