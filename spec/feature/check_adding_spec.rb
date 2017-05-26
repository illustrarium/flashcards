require 'rails_helper.rb'

feature 'Check adding card' do
  before :each do
    @user = FactoryGirl.create(:user)
    login_user_post("cat@cat.ru", "123") # login in with parameters
  end

  scenario 'with img' do
    visit '/cards/new'
    fill_in 'Оригинальный текст', with: 'cat'
    fill_in 'Перевод', with: 'кот'
    attach_file("Cardimg", Rails.root + "spec/photos/test.jpg")
    click_button 'Создать карточку'
    expect(page).to have_css('img')
  end
end
