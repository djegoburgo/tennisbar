class TournamentsController < ApplicationController

  require_relative './scrapper.rb'

  before_action :set_tournament, only: [:show, :search_rounds]
  before_action :set_selections
  before_action :set_pick

  def index
    require 'open-uri'
    require 'nokogiri'

    Tournament.destroy_all

    doc = Nokogiri::HTML(open("http://optasports.com/media/690773/tab1-2014.xml"))

    doc.search('tournament').each do |tournament|

    name = "#{tournament['name']}"
    id = "#{tournament['id']}"

    tournament = {
      "name": name,
      "id": id,
    }

    Tournament.find_or_create_by(tournament)

    end

    @tournaments = Tournament.all
  end

  def show
    scrapper
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def set_selections
    @selection = Selection.where(id: @tournament)
  end

  def set_pick
    @picks = Pick.where(selection_id: @tournament)
  end
end
