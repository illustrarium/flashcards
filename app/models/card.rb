class Card < ApplicationRecord
  belongs_to :user
  belongs_to :deck
  scope :time_to_review, -> { where("review_date <= ?", Time.now) }
  scope :random, -> { order("random()") }
  # scope :time_to_review, -> { where("review_date < '" + 2.days.from_now.strftime('%Y-%m-%d') + "'") }

  validates :original_text, :translated_text, :review_date, :deck, presence: true
  validate :check_texts

  before_validation :set_review_date, on: :create
  has_attached_file :cardimg, styles: { medium: "360x360>", thumb: "100x100>" }
  validates_attachment_content_type :cardimg, content_type: /\Aimage\/.*\z/

  def check_translate(user_variant)
    self.original_text.downcase == user_variant.downcase
  end

  def set_review_date(check_count = 0)
    # time interval between reviews - 12 hours, 3, 7, 14, 30 days
    intervals = [43_200, 259_200, 604_800, 1_209_600, 2_592_000]

    if check_count.zero?
      self.review_date = Time.now
    else
      (0..4).each do |i|
        self.review_date = Time.now + intervals[i] if check_count == i + 1
      end
    end

    self.check_count < 6 ? self.check_count += 1 : self.check_count = 1
  end

  def check_errors
    self.erros_count += 1

    if self.erros_count == 3
      self.check_count = 1
      self.erros_count = 0
      self.review_date = Time.now + 43200
    end
  end

  def remove_cardimg
    self.cardimg = nil
  end

  private

  def check_texts
    errors.add(:original_text, "Значения полей должны отличаться") if original_text.downcase == translated_text.downcase
  end
end
