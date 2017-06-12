class CardsMailer < ApplicationMailer
  default from: 'notifications@flashcards.ru'

  def pending_cards_notification(user)
    mg_client = Mailgun::Client.new ENV["MAILGUN_KEY"]
    @user = user
    @url  = ENV["ROOT_URL"]
    text = 'Не забудьте проверить карточки во Флэшкарточкере. Начните сейчас ' + @url
    message_params =  { 
                        from: 'Flashcards App <postmaster@sandboxbed4c42f22184d91ac3e09afb489bfcc.mailgun.org>',
                        to: @user.email,
                        subject: 'Не забудьте проверить карточки',
                        text: text
                      }
    mg_client.send_message 'sandboxbed4c42f22184d91ac3e09afb489bfcc.mailgun.org', message_params
    # mail(to: @user.email, subject: 'Не забудьте проверить карточки')
  end
end
