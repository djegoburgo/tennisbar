class PlayersController < ApplicationController

  def destroy
    @selection = Selection.find(params[:selection_id])
    selected_player = @selection.picks.where(player_id: params[:id])

    selected_player.first.destroy
    # @selection.destroy
    # @player = Player.find(params[:id])
    # @player.selection_id = nil
    # @player.save
    redirect_to tournament_path(@selection)
  end

end
