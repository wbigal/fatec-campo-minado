class GamesController < ApplicationController
  before_action -> { redirect_to(:root) unless request.xhr? }, only: [:create]
  before_action :load_player

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

  def load_player
    @player = Player.find_by(session_id: session.id)
  end
end
