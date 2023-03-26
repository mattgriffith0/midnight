class Player
    attr_accessor :purse, :current_score
    attr_reader :name

    def initialize(name, purse=100)
        @name = name
        @purse = purse
        @current_score = nil
    end
end