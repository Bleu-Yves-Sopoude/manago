require 'rails_helper'

RSpec.describe CategoryPurchase, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'User')
    purchase = Purchase.create(name: 'Test Purchase', amount: 100)
    category = Category.new(name: 'Test Category', icon: 'test_icon', user:)
    cat_pur = CategoryPurchase.new(purchase:, category:)
    expect(cat_pur).to be_valid
  end

  it 'is not valid without a valid purchase' do
    user = User.new(name: 'User')
    category = Category.new(name: 'Test Category', icon: 'test_icon', user:)
    cat_pur = CategoryPurchase.new(category:)
    expect(cat_pur).to_not be_valid
  end

  it 'is not valid without a valid category' do
    User.new(name: 'User')
    purchase = Purchase.create(name: 'Test Purchase', amount: 100)
    cat_pur = CategoryPurchase.new(purchase:)
    expect(cat_pur).to_not be_valid
  end
end
