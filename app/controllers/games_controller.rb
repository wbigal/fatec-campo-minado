class GamesController < ApplicationController
  def index
    @round = Round.on_game.first
  end
end
