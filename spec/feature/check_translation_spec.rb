# require 'spec_helper.rb'
require 'rails_helper.rb'
 
feature 'Checkin translation' do 
  before :each do
    @card = FactoryGirl.create(:card)
    @card.review_date = 2.days.ago
    @card.save
  end

  scenario 'Failed' do
    # 1 Идем на главную
    visit '/'
    # 2. Вводим неверный вариант
    fill_in 'user_variant', with: 'Believer'
    # 3. Кликаем проверить
    click_button 'Проверить'
    # 4. Ожидаем страницу с контентом "неверно"
    expect(page).to have_content('Неверно')
  end
end

# describe "Checkin translation", :type => :feature do
#   before :each do
#     @card = FactoryGirl.create(:card)
#     @card.review_date = 2.days.ago
#     @card.save
#   end

#   it "Failed" do
#     # 1 Идем на главную
#     visit root_path
#     # 2. Вводим неверный вариант
#     fill_in 'user_variant', with: 'Believer'
#     # 3. Кликаем проверить
#     click_link 'Проверить'
#     # 4. Ожидаем страницу с контентом "неверно"
#     expect(page).to have_content('Неверно')
#   end
# end
