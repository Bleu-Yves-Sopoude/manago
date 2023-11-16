require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without a name' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'has many categories' do
    user = User.reflect_on_association(:categories)
    expect(user.macro).to eq(:has_many)
  end

  it 'has many purchases' do
    user = User.reflect_on_association(:purchases)
    expect(user.macro).to eq(:has_many)
  end
end
