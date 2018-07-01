class GamesController < ApplicationController
  before_action -> { redirect_to(:root) unless request.xhr? }, only: [:create]

  def index
    @round = Round.on_game.first
  end

  def create
    create_new_round
    @round = Round.on_game.first
  end

  private

  def create_new_round
    ::Rounds::Create.call
  rescue ::Rounds::AlreadyRoundOnGame => ex
    logger.error(ex)
  end
end
