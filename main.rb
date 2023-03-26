require './lib/die.rb'
require './lib/display.rb'
require './lib/roll.rb'
require './lib/player.rb'
require './lib/round.rb'
require './lib/game.rb'

include Display

DICE_ONE = Die.new
DICE_TWO = Die.new
DICE_THREE = Die.new
DICE_FOUR = Die.new
DICE_FIVE = Die.new
DICE_SIX = Die.new

game = Game.new
game.play_rounds

# roll = Roll.new(remaining_dice_array).throw