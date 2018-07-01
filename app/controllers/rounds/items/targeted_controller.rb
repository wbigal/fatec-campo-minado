module Rounds
  module Items
    class TargetedController < ApplicationController
      before_action -> { redirect_to(:root) unless request.xhr? }
      before_action :load_round
      before_action :load_player

      def create
        @targeted_form = Rounds::Items::TargetedForm.new(
          targeted_params
        )

        if @targeted_form.valid?
          create_item_targeted
          notify_all
          render :create, status: :created, json: @round_item
        else
          render :create, status: :unprocessable_entity
        end
      end

      private

      def load_round
        @round = Round.on_game.find(params[:round_id])
      end

      def load_player
        @player = Player.create_with(name: Faker::Cat.name).
                  find_or_create_by(session_id: session.id)
      end

      def create_item_targeted
        @round_item = ::RoundItems::Target.call(
          round_id: @round.id,
          player_id: @player.id,
          row: @targeted_form.row,
          column: @targeted_form.column
        )
      end

      def targeted_params
        params.require(:rounds_items_targeted_form).permit(
          :row, :column
        )
      end

      def notify_all
        ActionCable.server.broadcast('round', round_item: @round_item)
      end
    end
  end
end
