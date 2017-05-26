require 'rails_helper.rb'

feature 'Access with login' do
  before :each do
    @card = FactoryGirl.create(:user)
    login_user_post("cat2@cat.ru", "123") # login in with parameters
  end

  scenario 'to main page' do
    visit '/'
    expect(page).to have_content('Добавить карточку')
  end

  scenario 'to add card page' do
    visit '/cards/new'
    expect(page).to have_content('Оригинальный текст')
  end

  scenario 'to cards page' do
    visit '/cards'
    expect(page).to have_content('Мои карточки')
  end

  scenario 'to users page' do
    visit '/users'
    expect(page).to have_content('Пользователи')
  end

  scenario 'or redirect from add users page to user page' do
    visit '/users/new'
    expect(page).to have_content('Вы не можете создавать пользователей.')
  end
end
