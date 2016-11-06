class RoundsController < ApplicationController


  before_action :set_tournament


  def index
    # @tournament = Tournament.find(params[:tournament_id])
    require 'nokogiri'

    Round.destroy_all

    file      = File.read(Rails.root.join('lib', 'seeds', 'chennai04_tournament.xml'))
    document  = Nokogiri::XML(file)

    round = {}

    document.xpath('tournament').each do |tournament|
       tournoi_id = "#{tournament['id']}"


    document.xpath('//round').each do |round|

     name = "#{round['name']}"
     number = "#{round['number']}"
     id = "#{round['id']}"

    round = {
      "id": id,
      "name": name,
      "number": number,
      "tournament_id": @tournament.id,
    }


    if tournoi_id.to_i == @tournament.id

    Round.create(round)

        end
      end
    end
    @rounds = Round.all

    # redirect_to tournament_path(8449)

  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
end
