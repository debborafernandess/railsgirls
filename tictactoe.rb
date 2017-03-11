require 'pry'

class TicTacToe
  BOARD = {
     top_l: '  ', top_m: '   ', top_r: '  ',
     mid_l: '  ', mid_m: '   ', mid_r: '  ',
     low_l: '  ', low_m: '   ', low_r: '  ',
  }

  def initialize
    @turn = 'X'
  end

  def play
    print_board

    move = ''

    9.times.each do | time |
      print "Turn of #{@turn}. Choose your position: "
      move = gets.chomp
      position = BOARD[move.to_sym].strip

      if position.empty?
        BOARD[move.to_sym] = " #{@turn} "
        @turn = change_turn
      else
        puts 'Essa jogada já foi feita. Escolha outra posição'
      end
      print_board
    end
  end

  def print_board
    lines = ['top', 'mid', 'low']

    avaliable_positions

    lines.each do | line |
      puts BOARD["#{line}_l".to_sym]  + ' |' +
           BOARD["#{line}_m".to_sym]  + '|' +
           BOARD["#{line}_r".to_sym]

      if line != 'low'
        puts('___ ___ ___')
      end
    end
  end

  def change_turn
    if @turn == 'X'
      return 'O'
    else
      return 'X'
    end
  end

  def avaliable_positions
    avaliables = []
    BOARD.collect do |key, value|
      avaliables << key if value.strip.empty?
    end

    puts "#{avaliables.compact.map(&:to_s)}"
  end
end


# Run Game
TicTacToe.new.play
puts 'Vc saiu do jogo! Até a próxima!'
