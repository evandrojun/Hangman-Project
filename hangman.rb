class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Hangman
  attr_accessor :letters_misses, :picked_word, :words_list, :begin_game, :word, :match_status, :answer

  def initialize
    @words_list = ["Banana", "Morango", "Uva", "Casa", "Paralelepipedo"]
    @letters_misses = 0
    @picked_word = ""
    @match_status = ""
    @word = Array.new
    @answer = Array.new
  end

  def begin_game
    @picked_word = @words_list.sample
    @word = @picked_word.split(//)
    @match_status = "Playing"
  end

  def check_result
    if @answer == @word
      @match_status = "You Win"
    elsif @letters_misses >= 6
      @match_status = "You Lose"
    end
  end

  def check_letter(c)
    i = 0

    until i >= @word.length
      if (c == @word[i])
        @answer[i] = c
      end
      i += 1
    end

    if !@word.include?(c)
      @letters_misses += 1
    end
  end

  def print_hangman
    if @letters_misses == 0
      puts "    _________"
      puts "    |        |"
      puts "    |        |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    /\\"
    elsif @letters_misses == 1
      puts `clear`

      puts "    _________"
      puts "    |        |"
      puts "    |        __"
      puts "    |       |__|"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    /\\"
    elsif @letters_misses == 2
      puts `clear`

      puts "    _________"
      puts "    |        |"
      puts "    |        __"
      puts "    |       |__|"
      puts "    |        |"
      puts "    |        |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    /\\"
    elsif @letters_misses == 3
      puts `clear`

      puts "    _________"
      puts "    |        |"
      puts "    |        __"
      puts "    |       |__|"
      puts "    |        |"
      puts "    |        |"
      puts "    |        /"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    /\\"
    elsif @letters_misses == 4
      puts `clear`

      puts "    _________"
      puts "    |        |"
      puts "    |        __"
      puts "    |       |__|"
      puts "    |        |"
      puts "    |        |"
      puts "    |        /\\"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    /\\"
    elsif @letters_misses == 5
      puts `clear`

      puts "    _________"
      puts "    |        |"
      puts "    |        __"
      puts "    |       |__|"
      puts "    |      __|"
      puts "    |        |"
      puts "    |        /\\"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    /\\"
    elsif @letters_misses == 6
      puts `clear`

      puts "    _________"
      puts "    |        |"
      puts "    |        __"
      puts "    |       |__|"
      puts "    |      __|__"
      puts "    |        |"
      puts "    |        /\\"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    |"
      puts "    /\\"
    end
  end
end

class Game
  attr_accessor

  def initialize(player)
    @player = Player.new(player)
    @game = Hangman.new
  end

  def start
    @game.begin_game

    while (@game.match_status == "Playing")
      @game.print_hangman
      puts @game.answer.join(" ")
      puts "\nMisses: #{@game.letters_misses}"

      print "\n#{@player.name}\nEnter a letter: "

      c = gets.chomp

      @game.check_letter(c)

      @game.check_result
    end

    puts @game.match_status
  end
end

print "Enter your name: "

player_name = gets.to_s

game = Game.new(player_name)

game.start
