
# require 'nokogiri'

# Player.destroy_all

# file      = File.read(Rails.root.join('lib', 'seeds', 'ranking.xml'))
# document  = Nokogiri::XML(file)

# document.xpath('//ranking').each do |ranking_node|
#   rank = "#{ranking_node['rank']}"
#  ranking_node.xpath('player').each do |player|
#   player_id = "#{player['id']}"

#   player = Player.where("id": player_id).first_or_initialize
#   player.rank = rank
#   player.save

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

      p Rank.find_or_create_by(rank)

    end
  end
end

# only create if the player_id exists for a given tournament_id
