require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validation tests' do
    it 'should have title' do
      event = Event.new(desc: 'description', location: 'location', date: Date.today).save
      expect(event).to eq(false)
    end

    it 'should have description' do
      event = Event.new(title: 'title', location: 'location', date: Date.today).save
      expect(event).to eq(false)
    end

    it 'should have location' do
      event = Event.new(title: 'title', desc: 'description', date: Date.today).save
      expect(event).to eq(false)
    end

    it 'should have date' do
      event = Event.new(title: 'title', desc: 'description', location: 'location').save
      expect(event).to eq(false)
    end
  end
end
