require 'bundler'
Bundler.require

require_relative 'lib/player'
#require_relative 'lib/game'
playerh = HumanPlayer.new("emerih")
puts "     _______________________________________
          |     Bienvenue Sur '<LE SURVIVANT>'    |

      |  Le But Du Jeu Est D'être le dernier survivant! |
       _________________________________________________"

puts "Entrer le nom de votre nom d'avatar : "
name_player = gets.chomp
user = HumanPlayer.new("#{name_player}")
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1 ,player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
	puts "Voici l'état de votre avatar: "
	puts user.show_state
	puts "Quelle action veux-tu effectuer?
				
				=> a - chercher une meilleure arme
				=> s - chercher à se soigner

				attaquer un joueur en vue: 
				=> 0 - #{player1.name} a #{player1.life_points} points de vie 
				=> 1 - #{player2.name} a #{player2.life_points} points de vie "


	puts "voici l'état de vos enemies: "
	puts ""
	puts player1.show_state
	puts player2.show_state
	action = gets.chomp 
	if action != "a" && action != "s" && action != "0" && action != "1"
	puts ""
	puts ">>>>>>>>Commande incorrect<<<<<<<<"
	end 
	puts ""
	if action == "a"
		user.search_weapon
	end	
	if action == "s"
		user.search_health_pack
	end
	if action == "0"
		user.attacks(player1)
	end	
	if action == "1"
		user.attacks(player2)
	end
	puts "Les autres joueurs t'attaquent !"
	enemies.each { |cop|
		if cop.life_points <=0
			 puts "#{cop.name} a été tué ,il ne peut plus attaquer"
		else
			cop.attacks(user) 	 
		end   }

end

puts "La partie est finie."

if user.life_points <= 0
	puts "Loser ! Tu as perdu !"
else
	puts  "BRAVO ! TU AS GAGNE !"	
end	

binding.pry
