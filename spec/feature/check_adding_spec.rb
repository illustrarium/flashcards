require 'rails_helper.rb'

feature 'Check adding card' do
  before :each do
    @user = FactoryGirl.create(:user)
    @deck = FactoryGirl.create(:deck, user_id: @user.id)
    login_user_post("cat2@cat.ru", "123") # login in with parameters
  end

  scenario 'with img' do
    visit '/cards/new'
    fill_in 'Оригинальный текст', with: 'cat'
    fill_in 'Перевод', with: 'кот'
    select 'Бизнес', from: "card_deck_id"
    attach_file("Cardimg", Rails.root + "spec/photos/test.jpg")
    click_button 'Создать карточку'
    expect(page).to have_css('img')
  end
end
