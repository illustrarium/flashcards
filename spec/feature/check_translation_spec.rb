require 'rails_helper.rb'

feature 'Checking translation' do
  before :each do
    @card = FactoryGirl.create(:card)
    @card.review_date = 2.days.ago
    @card.save
    login_user_post("cat2@cat.ru", "123") # login in with parameters
  end

  scenario 'Failed' do
    # 1. Goes to "/"
    visit '/'
    # 2. Wrong iput
    fill_in 'user_variant', with: 'Believer'
    # 3. Click check btn
    click_button 'Check it'
    # 4. Expect "Wrong" notice
    expect(page).to have_content('Incorrect')
  end

  scenario 'Success' do
    # 1. Goes to "/"
    visit '/'
    # 2. Wrong iput
    fill_in 'user_variant', with: 'Cat'
    # 3. Click check btn
    click_button 'Check it'
    # 4. Expect "Success" notice
    expect(page).to have_content('Correct')
  end
end
