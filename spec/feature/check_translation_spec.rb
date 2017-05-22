# require 'spec_helper.rb'
require 'rails_helper.rb'

feature 'Checkin translation' do 
  before :each do
    @card = FactoryGirl.create(:card)
    @card.review_date = 2.days.ago
    @card.save
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
end
