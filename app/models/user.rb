class User < ApplicationRecord
  has_many :cards
  has_many :decks
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  def self.notify_pending_cards
    User.joins(:cards).where("review_date <= ?", Time.now).each do |user|
      CardsMailer.pending_cards_notification(user)
    end
  end
end
