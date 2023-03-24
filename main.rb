require_relative 'die.rb'
require_relative 'display.rb'
require_relative 'roll.rb'

include Display

remaining_dice_array = []
DICE_ONE = remaining_dice_array << Die.new
DICE_TWO = remaining_dice_array << Die.new
DICE_THREE = remaining_dice_array << Die.new
DICE_FOUR = remaining_dice_array << Die.new
DICE_FIVE = remaining_dice_array << Die.new
DICE_SIX = remaining_dice_array << Die.new

banked_dice_array = []

roll = Roll.new(remaining_dice_array).throw