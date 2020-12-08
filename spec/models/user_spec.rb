require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'should have name' do
      user = User.new(email: 'd@gmail.com', password: 'aaaaaa').save
      expect(user).to eq(false)
    end

    it 'should have email' do
      user = User.new(name: 'John', password: 'aaaaaa').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(name: 'John', email: 'd@gmail.com', password: 'aaaaaa').save
      expect(user).to eq(true)
    end
  end
end
