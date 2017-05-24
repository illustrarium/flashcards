require 'rails_helper.rb'

feature 'Checkin translation' do 
  before :each do
    @card = FactoryGirl.create(:card)
    @card.review_date = 2.days.ago
    @card.save
    login_user_post("cat@cat.ru", "123") # login in with parameters
  end

  scenario 'Failed' do
    # 1. Goes to "/"
    visit '/'
    # 2. Wrong iput
    fill_in 'user_variant', with: 'Believer'
    # 3. Click check btn
    click_button 'Проверить'
    # 4. Expect "Wrong" notice
    expect(page).to have_content('Неверно')
  end

  scenario 'Success' do
    # 1. Goes to "/"
    visit '/'
    # 2. Wrong iput
    fill_in 'user_variant', with: 'Cat'
    # 3. Click check btn
    click_button 'Проверить'
    # 4. Expect "Success" notice
    expect(page).to have_content('Правильно')
  end
end
