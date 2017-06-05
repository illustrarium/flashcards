class CardsMailer < ApplicationMailer
  default from: 'notifications@flashcards.ru'

  def pending_cards_notification(user)
    @user = user
    @url  = ENV["ROOT_URL"]
    mail(to: @user.email, subject: 'Не забудьте проверить карточки')
  end
end
