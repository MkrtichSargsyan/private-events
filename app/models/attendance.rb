# frozen_string_literal: true

class Attendance < ApplicationRecord # rubocop:todo Style/Documentation
  belongs_to :user
  belongs_to :event
end
