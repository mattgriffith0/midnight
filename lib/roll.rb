class Roll
  def initialize(player, remaining_dice)
    @player = player
    @remaining_dice = remaining_dice
  end

  def throw
    roll_array = []
    banked_dice_array = []
    until @remaining_dice == []
      @remaining_dice.each do |die|
        roll_array << die.generate_roll
      end
      retain_dice(roll_array, banked_dice_array)
      roll_array = []
    end    
    final_result(banked_dice_array)
  end

  private

  def retain_dice(roll, banked)
    pp roll
    puts display_selection
    retain = gets.chomp.split("")
    legal_choice(roll, banked, retain)
  end

  def legal_choice(roll, banked, retain)
    if retain.empty?
      puts display_empty
      retain_dice(roll, banked)
    elsif retain.length > roll.length
      puts display_too_many_selections(roll.length)
      retain_dice(roll, banked)
    elsif retain.uniq != retain
      puts display_duplicates
      retain_dice(roll, banked)
    elsif retain.any? do |die| !(1..roll.length).include?(die.to_i) end
      puts display_out_of_range(roll.length)
      retain_dice(roll, banked)
    else
      retain.sort! { |a,b| b <=> a }
      retain.each do |die|
        banked << roll[die.to_i - 1]
        @remaining_dice.slice!(die.to_i - 1)
      end
      puts display_banked_dice(banked)
    end
  end

  def qualified?(banked)
    if banked.include?(1) && banked.include?(4)
      true
    else
      false
    end
  end

  def midnight?(score)
    if score.sum - 5 == 24
      puts display_midnight
    end
  end

  def final_result(banked)
    if qualified?(banked)
      if midnight?(banked)
        puts display_midnight
        score = 24
      else
        puts display_final_score(banked)
        score = banked.sum - 5
      end
    else
      puts display_unqualified
      score = -1
    end
  end
end