class Card < ApplicationRecord
  scope :time_to_review, -> { where("review_date < '" + Date.today.strftime('%Y-%m-%d') + "'") }
  # scope :time_to_review, -> { where("review_date < '" + 2.days.from_now.strftime('%Y-%m-%d') + "'") }

  validates :original_text, :translated_text, :review_date, presence: true
  validate :check_texts

  before_validation :set_review_date, on: :create

  def check_translate(user_variant)
    self.original_text.downcase == user_variant.downcase
  end

  def set_review_date
    self.review_date = 3.days.from_now
  end

  private

  def check_texts
    errors.add(:original_text, "Значения полей должны отличаться") if original_text.downcase == translated_text.downcase
  end
end
