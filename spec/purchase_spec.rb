require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'Test User')
    purchase = Purchase.new(name: 'Test Purchase', amount: 42.50, author: user)
    expect(purchase).to be_valid
  end

  it 'is not valid without a name' do
    purchase = Purchase.new(amount: 42.50)
    expect(purchase).to_not be_valid
  end

  it 'is not valid with a negative amount' do
    purchase = Purchase.new(name: 'Test Purchase', amount: -42.50)
    expect(purchase).to_not be_valid
  end
end
