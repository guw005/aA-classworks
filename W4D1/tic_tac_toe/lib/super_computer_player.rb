require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    board = game.board
    node = TicTacToeNode.new(board,mark)
    node.children.each {|child| return child.prev_move_pos if child.winning_node?(mark)}
    node.children.each {|child| return child.prev_move_pos unless child.losing_node?(mark)}
    raise "impossible condition"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
