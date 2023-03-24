module Display
  def display_welcome
      "Welcome to MIDNIGHT! Let's throw some bones"
  end

  def display_selection
    "Choose which dice you'd like to retain."
  end

  def display_empty
    "Please enter a number"
  end

  def display_too_many_selections(length)
    "You've entered too many selections. Please enter up to #{length} numbers."
  end

  def display_duplicates
    "Enter each number only once."
  end

  def display_out_of_range(length)
    "You've entered an invalid number. Please enter only numbers between 1 and #{length}."
  end

  def display_banked_dice(banked)
    "You've banked the following dice: #{banked.join(", ")}"
  end

  def display_qualified(banked)
    "You're qualified - your current score is #{banked.sum - 5}"
  end

  def display_unqualified
    "UNQUALIFIED!"
  end

  def display_final_score(banked)
    "You've qualified! Your final score is #{banked.sum - 5}"
  end

  def display_midnight
    [
      "That's a midnight!",
      "We got a midnight here!",
      "All the dots we got - Midnight!",
      "Ante up everyone, we got a midnight!"
    ].sample
  end
end