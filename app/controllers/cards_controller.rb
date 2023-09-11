class CardsController < ApplicationController
  before_action :set_deck, only: [:index, :new, :create]
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = @deck.cards
  end

  def show
  end

  def new
    @card = @deck.cards.build
  end

  def create
    @card = @deck.cards.build(card_params)
    if @card.save
      redirect_to deck_card_path(@deck, @card), notice: 'カードが作成されました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to deck_card_path(@deck, @card), notice: 'カードが更新されました'
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to deck_cards_path(@deck), notice: 'カードが削除されました'
  end

  private

  def set_deck
    @deck = Deck.find(params[:deck_id])
  end

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:front, :back)
  end
end
