class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	p1_strat = game[0][1].downcase
	raise NoSuchStrategyError unless p1_strat == 'r' || p1_strat == 'p' || p1_strat == 's' 
	p2_strat = game[1][1].downcase
	raise NoSuchStrategyError unless p2_strat == 'r' || p2_strat == 'p' || p2_strat == 's'
	if p1_strat == p2_strat
		game[0]
	elsif p1_strat == 's' && p2_strat == 'p'
		game[0]
	elsif p2_strat == 's' && p1_strat == 'p'
		game[1]
	elsif p1_strat == 'r' && p2_strat == 'p'
		game[1]
	elsif p2_strat == 'r' && p1_strat == 'p'
		game[0]
	elsif p1_strat == 's' && p2_strat == 'r'
		game[1]
	elsif p2_strat == 's' && p1_strat == 'r'
		game[0]
	end
end
