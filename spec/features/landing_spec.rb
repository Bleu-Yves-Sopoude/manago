# spec/features/landing_page_text_spec.rb
require 'rails_helper'

RSpec.feature 'Landing Page Text', type: :feature do
  scenario 'User visits the landing page and sees the instruction text' do
    visit root_path

    # Alternatively, you can check for the specific text
    expect(page).to have_text('Kindly log in or create an account to begin.')
  end
end
