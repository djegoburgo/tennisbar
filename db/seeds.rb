  # require 'nokogiri'

  # # scraped_tournament = @tournament.id.to_s + ".xml"

  # file      = File.read(Rails.root.join('lib', 'seeds', '8449.xml'))
  # document  = Nokogiri::XML(file)

  # round = {}

  # # récupération du tournament id pour s'assurer que l'on afficher les données du bon tournoi
  # document.xpath('tournament').each do |tournament|
  # tournoi_id = "#{tournament['id']}"

  #   # récupération des infos relatives au round

  #     Round.destroy_all
  #     Match.destroy_all
  #     Score.destroy_all
  #     Firstentry.destroy_all
  #     Secondentry.destroy_all
  #     # Player.destroy_all

  #       document.xpath('//round').each do |roundnode|
  #       name = "#{roundnode['name']}"
  #       number = "#{roundnode['number']}"
  #       round_id = "#{roundnode['id']}"

  #       round = {
  #         "id": round_id,
  #         "name": name,
  #         "number": number,
  #         "tournament_id": tournoi_id,
  #       }

  #       roundnode.xpath('match').each do |matchnode|
  #       match_id = "#{matchnode['id']}"
  #       match_date = "#{matchnode['date']}"

  #       match = {
  #         "id": match_id,
  #         "round_id": round_id,
  #         "match_date": match_date
  #       }

  #       p Match.find_or_create_by(match)


  #     end
  #   end
  # end










require 'nokogiri'

Rank.destroy_all

Dir[File.join('lib', 'seeds', '*.xml')].each do |scrap_file|

file      = File.read(Rails.root.join(scrap_file))
document  = Nokogiri::XML(file)

      document.xpath('tournament').each do |tournamentnode|
        tournament_id = "#{tournamentnode['id']}"

      document.xpath('//player').each do |playernode|
        player_id = "#{playernode['id']}"
        rank = "#{playernode['rank']}"

      rank = {
        "tournament_id": tournament_id,
        "player_id": player_id,
        "current_rank": rank
      }

      Rank.find_or_create_by(rank)

    end
  end
end


