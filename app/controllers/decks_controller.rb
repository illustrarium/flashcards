class DecksController < ApplicationController
  def index
    @decks = current_user.decks
  end

  def show
    @deck = Deck.find(params[:id])
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.build(deck_params)
    if @deck.save
      redirect_to @deck, notice: 'Колода успешно создана'
    else
      render :new
    end
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])

    if @deck.update(deck_params)
      redirect_to @deck, notice: "Колода успешно обновлена"
    else
      redirect_to @deck, notice: "Колода не обновлена"
    end
  end

  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to decks_path
  end

  def set_current
    deck = Deck.find(params[:deck][:id])
    current_user.current_deck_id = deck.id
    if current_user.save
      redirect_to decks_path, notice: "Текущая колода обновлена"
    else
      redirect_to decks_path, alert: "Ошибка! Текущая колода не обновлена"
    end
  end

  private

  def deck_params
    params.require(:deck).permit(:title, :current)
  end
end
