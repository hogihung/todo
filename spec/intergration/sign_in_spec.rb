require 'spec_helper'

feature 'Sign in as a user' do 
  scenario 'with an email address' do
    sign_in_as('jane_doe@email.com')
    expect(page).to have_css '.welcome', text: 'Welcome, jane_doe@email.com'
  end
end