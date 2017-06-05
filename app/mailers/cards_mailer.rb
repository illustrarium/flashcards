class CardsMailer < ApplicationMailer
  default from: 'notifications@flashcards.ru'

  def pending_cards_notification(user)
    @user = user
    @url  = 'https://damp-lake-42188.herokuapp.com/'
    mail(to: @user.email, subject: 'Не забудьте проверить карточки')
  end
end
