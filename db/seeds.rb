
require 'nokogiri'

file      = File.read(Rails.root.join('lib', 'seeds', 'ranking.xml'))
document  = Nokogiri::XML(file)

document.xpath('//ranking').each do |ranking_node|
  rank = "#{ranking_node['rank']}"
 ranking_node.xpath('player').each do |player|
  player_id = "#{player['id']}"

  # p player = {
  #   "id": player_id,
  #   "rank": rank
  # }

  # Player.find_or_create_by(player)

  player = Player.where("id": player_id).first_or_initialize
  player.rank = rank
  player.save

  end
end
