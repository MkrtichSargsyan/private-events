class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events,class_name:'Event',foreign_key:'creator_id', dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :event_attended, through: :attendances, source: :event
end
