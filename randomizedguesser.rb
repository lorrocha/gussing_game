require 'pry'
require 'pry-debugger'


class RandomGuesser  
  def initialize
    puts "Welcome to Random Guesser!"
    get_max
  end

  def get_max
    puts "What do you want to be your maximum range?"
    @MAX_NUMBER = get_valid_input
    set_rand
   end

  def get_valid_input
    input = gets.chomp
    validate_input(input)
  end

  def validate_input(input)
    if input.match(/\A\d*\z/)
      input.to_i
    else
      puts "Sorry, that's not a valid input - please try again!"
      get_valid_input
    end

  end

  def set_rand(number = @MAX_NUMBER)
    @ANSWER = rand(number + 1)
    check_guess
  end

  def get_guess
    puts "What number would you like to guess?"
    get_valid_input
  end
  
  def check_guess
    guess = get_guess
  
    if guess < @ANSWER
      @ENDSTATE = "low"
    elsif guess > @ANSWER
      @ENDSTATE = "high"
    else
      @ENDSTATE = "won"
    end
    display_feedback
  end

  def display_feedback
    if @ENDSTATE == "low"
      puts "Sorry, looks like you're guess is too low! Try again."
      check_guess
    elsif @ENDSTATE == "high"
      puts "Whoa, you're guess is too high! Try again."
      check_guess
    else
      puts "Congratulations! You totally won the game!"
    end
  end
end

RandomGuesser.new