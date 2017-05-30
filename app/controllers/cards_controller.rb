class CardsController < ApplicationController
  def index
    @cards = current_user.cards
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @card = current_user.cards.build(card_params)
    if @card.save
      redirect_to @card, notice: 'Карточка успешно создана'
    else
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])

    unless card_params[:cardimg]
      @card.remove_cardimg
    end

    if @card.update(card_params)
      redirect_to @card, notice: "Карточка успешно обновлена"
    else
      redirect_to @card, notice: "Карточка не обновлена"
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path
  end

  private

  def card_params
    params.require(:card).permit(:review_date, :original_text, :translated_text, :cardimg, :deck_id, cardimg: [:cardimg_file_name, :icardimg_file_size, :cardimg_content_type, :cardimg_updated_at])
  end
end
