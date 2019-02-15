module  Mastermind
  class Checker
    attr_reader :corrections
    def initialize(answer)
      @answer = answer
      @corrections = []
    end

    def check(guess)
      @guess = guess
      return true if @answer == guess
      check_chars(guess)
      check_length(guess)
      return false
    end

    def check_chars(guess)
      unless (char = guess.delete('rbgy')).empty?
        @corrections << "(r)ed (b)lue (g)reen (y)ellow does not include (#{char})"
      end
    end

    def check_length(guess)
      if guess.length != @answer.length
        @corrections << "Guess was #{guess.length} characters. Guess should be #{@answer.length} characters"
      end
    end

    def correct_positions
      @guess.chars.map.with_index do |char, i|
        @answer[i] == char
      end.count(true)
    end


  end
end
