class HomeController < ApplicationController
  def index
    if current_user.current_deck_id
      @card = current_user.cards.time_to_review.where("deck_id = " + current_user.current_deck_id.to_s + "").order("random()").limit(1)
    else
      @card = current_user.cards.time_to_review.order("random()").limit(1)
    end
  end

  def check
    @card = Card.find(params[:card][:id])

    if @card.check_translate(params[:user_variant])
      @card.set_review_date
      @card.save
      redirect_to home_index_path, notice: "Правильно"
    else
      redirect_to home_index_path, alert: "Неверно"
    end
  end
end
