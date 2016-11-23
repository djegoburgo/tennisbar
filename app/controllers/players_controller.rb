class PlayersController < ApplicationController

  def show
    @tournament = Tournament.find(params[:tournament_id])
    @round = Round.find(params[:round_id])
    @match = Match.find(params[:match_id])
    @firstentry = Firstentry.find(params[:firstentry_id])
    # @secondentry_ = Secondentry_.find(params[:secondentry_id])
    # @player = Player.find(params[:id])
     raise

    selection = {
      "name": "bien le bonjour"
    }

    @selection = Selection.new(selection)
    @selection.save
    redirect_to tournament_path(@tournament)
  end

end
