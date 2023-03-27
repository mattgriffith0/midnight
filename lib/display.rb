module Display
  def display_welcome
      puts "=============================================="
      puts ""
      puts "-- Welcome to MIDNIGHT! Let's throw some bones"
      puts ""
      puts "=============================================="
  end

  def display_number_of_players_prompt
    "-- How many people are playing today? "
  end

  def display_name_prompt(number)
    "-- Enter player #{number}'s name: "
  end

  def display_ante_up(players, total)
    "-- Ante up! #{players.length} players, pot size of $#{total}."
  end

  def display_player_turn(name)
    "-- It's now #{name}'s turn!"
  end

  def display_selection
    "-- Choose which dice you'd like to retain."
  end

  def display_empty
    "-- Please enter a number"
  end

  def display_too_many_selections(length)
    "-- You've entered too many selections. Please enter up to #{length} numbers."
  end

  def display_duplicates
    "-- Enter each number only once."
  end

  def display_out_of_range(length)
    if length == 1
      "-- You can only enter 1."
    else
      "-- You've entered an invalid number. Please enter only numbers between 1 and #{length}."
    end
  end

  def display_banked_dice(banked)
    "-- You've banked the following dice: #{banked.join(", ")}"
  end

  def display_qualified(banked)
    "-- You're qualified - your current score is #{banked.sum - 5}"
  end

  def display_unqualified
    "-- UNQUALIFIED!"
  end

  def display_unqualified_fee
    "-- Gotta pay up!"
  end

  def display_below_high_score
    "-- Your score was below the high score."
  end

  def display_pot_total(total)
    "-- The pot now has a total of $#{total}."
  end

  def display_high_score(score)
    "-- You now have the high score of #{score}!"
  end

  def display_tie_high_score(score, players)
    "-- You now share the high score of #{score} with #{players.length - 1} other people."
  end

  def display_final_score(banked)
    "-- You've qualified! Your final score is #{banked.sum - 5}"
  end

  def display_round_tie(score, players)
    name_arr = []
    players.each do |player|
      name_arr << player.name
    end
    if name_arr.length == 2
      "-- #{name_arr.join(" and ")} tied with a high score of #{score}. Let's go again!"
    else
      "-- #{name_arr.join(", ")} tied with a high score of #{score}. Let's do it again!"
    end
  end

  def display_round_win(score, players, pot)
    "-- Congratulation #{players[0].name}! You won the round with a score of #{score}, and collected $#{pot}!"
  end

  def display_new_round_prompt
    "-- Do you want to play another round? "
  end

  def display_midnight
    [
      "-- That's a midnight!",
      "-- We got a midnight here!",
      "-- All the dots we got - Midnight!",
      "-- Ante up everyone, we got a midnight!"
    ].sample
  end

  def display_stats(players)
    puts "-----------------"
    players.each do |player|
      puts "#{player.name} - $#{player.purse}"
    end
    puts "-----------------"
  end

  def display_game_over
    "-- Thank you for playing!"
  end
end