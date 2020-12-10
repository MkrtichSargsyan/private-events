# frozen_string_literal: true

# rubocop:todo Style/Documentation
class ChangeEventsUserColumnId < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :user_id, :creator_id
  end
end
# rubocop:enable Style/Documentation
