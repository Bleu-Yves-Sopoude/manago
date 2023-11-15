# test/models/category_test.rb

require 'rails_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should be valid with valid attributes' do
    category = Category.new(name: 'Food', icon: 'fa-cutlery')
    assert category.valid?
  end

  test 'should not be valid without a name' do
    category = Category.new(icon: 'fa-cutlery')
    assert_not category.valid?, 'Category is valid without a name'
  end

  test 'should not be valid without an icon' do
    category = Category.new(name: 'Food')
    assert_not category.valid?, 'Category is valid without an icon'
  end

  test 'should have a user association' do
    category = Category.new(name: 'Food', icon: 'fa-cutlery')
    category.user = users(:one) # Assuming you have a fixture for users
    assert category.valid?
  end

  test 'should have a purchases association' do
    category = Category.new(name: 'Food', icon: 'fa-cutlery')
    category.purchases << purchases(:one) # Assuming you have a fixture for purchases
    assert category.valid?
  end
end
