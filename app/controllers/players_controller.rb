class PlayersController < ApplicationController
  before_action -> { redirect_to(:root) unless request.xhr? }, only: [:top_ten]

  def top_ten
    @players = Player.order(score: :desc).take(10)
    render 'top_ten', layout: nil
  end
end
