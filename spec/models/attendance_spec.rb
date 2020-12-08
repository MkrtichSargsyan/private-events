require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'Associations' do
    it 'should have foreign key user_id' do
      attendance = Attendance.reflect_on_association(:user)
      expect(attendance.foreign_key).to eq('user_id')
    end

    it 'should have foreign key user_id' do
      attendance = Attendance.reflect_on_association(:event)
      expect(attendance.foreign_key).to eq('event_id')
    end

    it 'should have an user and event' do
      @user = User.create(name: 'John', email: 'd@gmail.com', password: 'aaaaaa')
      @event = @user.created_events.create(title: 'title', desc: 'description', date: Date.today, location: 'location')
      @attendance = Attendance.create(user_id: @user.id, event_id: @event.id)

      expect(Attendance.first.user).to eq(@user)
      expect(Attendance.first.event).to eq(@event)
    end
  end
end
