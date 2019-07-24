require 'pry'

class Player
	attr_accessor :name, :life_points
	@@all_player = []
	def initialize (name_player)
		@name = name_player
		@life_points = 10 
		@@all_player << self
	end 

	def self.all
		puts @@all_player
	end

	def show_state
		puts "#{@name} a #{life_points} points de vie"
	end	

	def gets_dammage(dammage_points)
		@life_points += - dammage_points
		if @life_points <= 0
			puts "le joueur #{@name} a été tué !"
		end	  
	end	

	def attacks(player)
		puts "le joueur #{self.name} attaque le joueur #{player.name}"
		dammage_points = compute_damage
		puts "Il lui inflige #{dammage_points} points de dommages."
		player.gets_dammage(dammage_points)
		
	end
	
	def compute_damage
		return rand(1..6)
	end	
end	


class HumanPlayer < Player
	attr_accessor :weapon_level
		def initialize (name_player)
			@name = name_player
			@life_points = 100
			@weapon_level = 1
		end	

		def show_state
			puts " #{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
		end
		
		def compute_damage
			return rand(1..6)* @weapon_level
		end	 	

		def search_weapon
			@weapon_level_new	= rand(1..6)
			puts "Tu as trouvé un arme de niveau #{@weapon_level_new}."
			if @weapon_level_new > @weapon_level
				puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
				@weapon_level = @weapon_level_new
			else
				puts "#QDZJR;SÙ*''()$$$ ........ elle n'est pas mieux que ton arme actuelle....."
			end	

		end	

		def search_health_pack
			@health_pack = rand(1..6)
			if @health_pack == 1 
				puts   "Tu n'as rien trouvé...(' ')"
			elsif @health_pack >= 2 && @health_pack <=5
				puts "Bravo,(^-^) tu as trouvé un pack de +50points de vie!"
				if (@life_points + 50) > 100
					@life_points = 100
				else 
					@life_points = @life_points + 50	 
				end 
			else
				puts "Waow (^o^), tu as trouvé un pack de +80 points de vie !"
				if (@life_points + 80) > 100
					@life_points = 100
				else 
					@life_points = @life_points + 80	 
				end 
			end	
					
		end	
end		

