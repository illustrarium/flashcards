class SuperMemo2
  def initialize(card)
    @card = card
  end

  def successful(quality)
    @card.check_count += 1
    if @card.check_count == 1
      @card.interval = 1
    elsif @card.check_count == 2
      @card.interval = 6
    else
      @card.efactor = @card.efactor + (0.1 - (5 - quality.to_i) * (0.08 + (5 - quality.to_i) * 0.02))
      @card.efactor = 1.3 if @card.efactor < 1.3
      @card.interval *= @card.efactor
    end
    @card.review_date = Time.now + @card.interval.days
    @card.save
  end

  def failed
    if @card.erros_count == 3
      @card.set_review_date
      @card.check_count = 1
      @card.erros_count = 0
    else
      @card.erros_count += 1
    end
    @card.save
  end
end
