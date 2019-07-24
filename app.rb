require 'bundler'
Bundler.require

require_relative 'lib/player'
#require_relative 'lib/game'
player1 = Player.new("Josiane")
player2 = Player.new("José")
while player1.life_points > 0 && player2.life_points >0 

	puts "Voici l'état de chaque joueur: "
	puts ""
	puts player2.show_state
	puts player1.show_state
	puts "Début du phase d'attaque"
	player1.attacks(player2)
	if player2.life_points <=0
		puts player2.show_state
		puts player1.show_state	
		puts "END GAME"
		break
	else	
		player2.attacks(player1)
		if  player1.life_points <=0
				puts player2.show_state
				puts player1.show_state	
				puts "END GAME"
				break
			end			
	end
	
end