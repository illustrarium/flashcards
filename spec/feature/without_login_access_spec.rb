require 'rails_helper.rb'

feature 'Access without login' do
  scenario 'Redirect from main to login page' do
    visit '/'
    expect(page).to have_content('Please log in')
  end

  scenario 'Redirect from add card page to login page' do
    visit '/cards/new'
    expect(page).to have_content('Please log in')
  end

  scenario 'Redirect from cards page to login page' do
    visit '/cards'
    expect(page).to have_content('Please log in')
  end

  scenario 'Access register page' do
    visit '/users/new'
    expect(page).to have_content('Sign up')
  end

  scenario 'Redirect from users page to login page' do
    visit '/users'
    expect(page).to have_content('Please log in')
  end
end
