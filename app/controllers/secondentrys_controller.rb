class SecondentrysController < ApplicationController
  before_action :set_params

  def show
    total_rank_array = []

    selection_id = @secondentry.player.selection_id = @selection.id

    @selection.players.each do |player|
      total_rank_array << player.rank
    end
    # if @selection.players.count > 3
    #   redirect_to tournaments_path
    # else
    #   @secondentry.player.save({"selection_id": selection_id})
    #   redirect_to(tournament_path(@tournament))
    # end
    if
      @selection.players.count == 2 and total_rank_array.inject(0){|sum,x| sum + x } < 30
      flash[:alert] = "nawak"
      redirect_to(tournament_path(@tournament))
    elsif
      @selection.players.count > 3
      flash[:notice] = "nawak"
      redirect_to(tournament_path(@tournament))
    else
      @secondentry.player.save({"selection_id": selection_id})
      redirect_to(tournament_path(@tournament))
    end
  end

    private

  def set_params
    @tournament = Tournament.find(params[:tournament_id])
    @round = Round.find(params[:round_id])
    @match = Match.find(params[:match_id])
    @secondentry = Secondentry.find(params[:id])
    @selection = Selection.find_or_create_by("id": @tournament.id)
  end
end
