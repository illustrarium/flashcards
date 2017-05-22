# require 'rails_helper.rb'
 
# feature 'Checkin translation' do  
#   scenario 'Failed' do
#     # 1 Идем на главную
#     visit '/'
#     # 2. Вводим неверный вариант
#     fill_in 'user_variant', with: 'Believer'
#     # 3. Кликаем проверить
#     click_link 'commit'
#     # 4. Ожидаем страницу с контентом "неверно"
#     expect(page).to have_content('Неверно')
#   end
# end


describe "Checkin translation", :type => :feature do
  let(:card) { FactoryGirl.create(:card) }

  it "Failed" do
    visit '/'
    # fill_in 'user_variant', with: 'Believer'
    # click_link 'Проверить'
    # expect(page).to have_content('Неверно')
  end
end