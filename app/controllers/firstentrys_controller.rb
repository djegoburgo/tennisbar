class FirstentrysController < ApplicationController

  before_action :set_params

  def show
      total_rank_array = []

      selection_id = @firstentry.player.selection_id = @selection.id

      @selection.players.each do |player|
        total_rank_array << player.rank
      end

      # if @selection.players.size >= 3
      #   flash[:notice] = "3 joueurs max"
      # end

      # if @selection.players.size >= 3
      #   flash[:notice] = "3 joueurs max"
      # end

      # if @selection.players.size <= 2 and total_rank_array.inject(0){|sum,x| sum + x } > 60
      #   @firstentry.player.save({"selection_id": selection_id})
      #   redirect_to(tournament_path(@tournament))
      #   raise
      # else
      #   redirect_to tournaments_path
      # end

      if
        @selection.players.count == 3 and total_rank_array.inject(0){|sum,x| sum + x } < 60
        flash[:alert] = "nawak"
        redirect_to(tournament_path(@tournament))
      elsif
        @selection.players.count > 3
        flash[:notice] = "nawak"
        redirect_to(tournament_path(@tournament))
      else
        @firstentry.player.save({"selection_id": selection_id})
        redirect_to(tournament_path(@tournament))
      end
  end

    private

  def set_params
    @tournament = Tournament.find(params[:tournament_id])
    @round = Round.find(params[:round_id])
    @match = Match.find(params[:match_id])
    @firstentry = Firstentry.find(params[:id])
    @selection = Selection.find_or_create_by("id": @tournament.id)
  end
end
