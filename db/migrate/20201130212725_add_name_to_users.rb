# frozen_string_literal: true

# rubocop:todo Style/Documentation
class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
  end
end
# rubocop:enable Style/Documentation
