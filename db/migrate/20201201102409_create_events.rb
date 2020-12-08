# frozen_string_literal: true

# rubocop:todo Style/Documentation
class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :desc
      t.datetime :date
      t.text :location

      t.timestamps
    end
  end
end
# rubocop:enable Style/Documentation
