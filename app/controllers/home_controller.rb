class HomeController < ApplicationController
  def index
    @card = Card.time_to_review.order("random()").limit(1)
  end

  def check
    @card = Card.find(params[:card][:id])
    
    if @card.check_translate(params[:user_variant])
      new_date = 3.days.from_now
      @card.update(review_date: new_date)
      redirect_to home_index_path, notice: "Правильно"
    else
      redirect_to home_index_path, alert: "Неверно"
    end
  end
end
