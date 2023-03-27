class Round
  require_relative 'roll.rb'

  attr_reader :players
  attr_accessor :high_score, :high_scorer, :pot, :remaining_dice_array

  def initialize(players)
    @players = players
    @high_score = 0
    @high_scorer = []
    @pot = 0
    @remaining_dice_array = []
  end

  def play_round
    start_round
    player_rolls
    end_round
  end

  private

  def start_round
    reset_score
    @players.each do |player|
      player.purse -= 1
      @pot += 1
    end
    puts display_ante_up(@players, @pot)
  end

  def player_rolls
    @players.each do |roller|
      reset_dice
      puts display_player_turn(roller.name)
      player_roll = Roll.new(roller, @remaining_dice_array).throw
      if player_roll == 24
        puts display_midnight
        @players.each do |player|
          next if player == roller
          player.purse -= 1
          @pot += 1
        end
      end
      if player_roll > @high_score
        @high_score = player_roll
        @high_scorer[0] = roller
        puts display_high_score(@high_score)
      elsif player_roll == @high_score
        puts display_tie_high_score(@high_score, @high_scorer)
        @high_scorer << roller
      elsif player_roll == -1
        puts display_unqualified_fee
        roller.purse -= 1
        @pot += 1
        puts display_pot_total(@pot)
      else
        puts display_below_high_score
      end
    end
  end

  def end_round
    if @high_scorer.length > 1
      puts display_round_tie(@high_score, @high_scorer)
      @players.rotate!(1)
      play_round
    else
      puts display_round_win(@high_score, @high_scorer, @pot)
      @high_scorer[0].purse += @pot
      @pot = 0
      new_round(@players)
    end
  end

  def new_round(players)
    puts display_new_round_prompt
    new = gets.chomp.downcase
    if new == "y" || new == "yes"
      display_stats(players)
      players.rotate!(1)
      play_round
    elsif new == "n" || new == "no"
      display_stats(players)
      puts display_game_over
    else
      puts "Please enter y or n"
      new_round(players)
    end
  end

  def reset_score
    @high_score = 0
    @high_scorer = []
  end

  def reset_dice
    @remaining_dice_array = [
      DICE_ONE,
      DICE_TWO,
      DICE_THREE,
      DICE_FOUR,
      DICE_FIVE,
      DICE_SIX
    ]
  end
end