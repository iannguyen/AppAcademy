require_relative 'player'

# Ghost game
class Game
  ALPHABET = ('a'..'z').to_a

  attr_reader :players, :fragment, :dictionary, :losses

  def initialize(*players)
    @players = players
    @fragment = ''
    @dictionary = File.readlines('dictionary.txt').map(&:chomp)
    @losses = {}

    players.each { |player| @losses[player] = 0 }
  end

  def run
    puts "Let's play Ghost!"
    play_round until game_over?
    puts "#{current_player} wins!"
  end

  def standings
    puts 'The current score is:'
    players.each do |player|
      puts "#{player}:   #{record(player)}"
    end
  end

  def play_round
    @fragment = ''
    puts "#{current_player}, guess a letter."
    until round_over?
      take_turn(current_player)
      puts "The current fragment is #{fragment}."
      next_player!
    end
    @losses[previous_player] += 1
    puts "#{previous_player} spelled #{fragment}. They lose this round!"
    standings
  end

  def round_over?
    dictionary.include?(fragment)
  end

  def game_over?
    losses[previous_player] == 5
  end

  def record(player)
    count = @losses[player]
    'GHOST'.slice(0, count)
  end

  def current_player
    players.first
  end

  def previous_player
    players.last
  end

  def next_player!
    players.rotate!.first
  end

  def take_turn(player)
    letter = nil
    until letter && valid_play?(letter)
      letter = player.guess
      player.alert_invalid_guess(letter) unless valid_play?(letter)
    end
    add_letter(letter)
  end

  def add_letter(letter)
    @fragment += letter
  end

  def valid_play?(letter)
    return false if !ALPHABET.include?(letter)
    hypothetical = fragment + letter
    dictionary.any? do |word|
      word.start_with?(hypothetical)
    end
  end
end

if $PROGRAM_NAME == __FILE__
  game = Game.new(Player.new('Ian'), Player.new('Tracie'))
  game.run
end
