require 'spec_helper'

feature 'Sign in as a user' do 
  scenario 'with an email address' do
    visit root_path
    fill_in 'Email address', with: 'jane_doe@email.com'
    click_button 'Sign In'
    expect(page).to have_css '.welcome', text: 'Welcome, jane_doe@email.com'
  end
end