module  Mastermind
  class Checker
    attr_reader :corrections
    def initialize(answer)
      @answer = answer
      @corrections = []
    end
    def check(guess)
      return true if @answer == guess
      if char = guess.delete('rbgy')
        @corrections << "(r)ed (b)lue (g)reen (y)ellow does not include (#{char})"
      end
      return false
    end
  end
end
