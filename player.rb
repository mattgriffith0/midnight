class Player
    attr_accessor :purse, :score
    attr_reader :name

    def initialize(name, purse=100)
        @name = name
        @purse = purse
        @score = nil
    end
end