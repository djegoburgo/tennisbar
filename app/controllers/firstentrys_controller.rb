class FirstentrysController < ApplicationController

  before_action :set_params

  def show

    # selection = {
    #   "id": @tournament.id
    # }

    # @selection = Selection.new(selection)
    # @selection.player = @firstentry
    selection_id = @firstentry.player.selection_id = @selection.id
    # @firstentry.player.update!
    @firstentry.player.save({"selection_id": selection_id})
    # @selection.save
    redirect_to(tournament_path(@tournament))
    # raise
  end

    private

  def set_params
    @tournament = Tournament.find(params[:tournament_id])
    @round = Round.find(params[:round_id])
    @match = Match.find(params[:match_id])
    @firstentry = Firstentry.find(params[:id])
    # @secondtentry = Secondtentry.find(params[:secondtentry_id])
    # @player = Player.find(params[:id])
    @selection = Selection.find_or_create_by("id": @tournament.id)
  end
end
