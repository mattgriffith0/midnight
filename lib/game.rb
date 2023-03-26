class Game
  def initialize
    @players = []
    puts display_welcome
    puts display_number_of_players_prompt
    num_of_players = gets.chomp.to_i
    i = 1
    num_of_players.times do
      create_player(@players, i)
      i += 1
    end
  end

  def play_rounds
    round = Round.new(@players).play_round
  end

  private

  def create_player(player_arr, number)
    puts display_name_prompt(number)
    name = gets.chomp
    player = Player.new(name)
    player_arr << player
  end
end