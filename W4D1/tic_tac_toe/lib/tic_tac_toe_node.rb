require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    # evaluator == current player's mark
    return false if @board.over? && (@board.winner == nil || @board.winner == evaluator)
    return true if @board.over? && @board.winner != evaluator

    # return true if self.children.all? {|child| child.losing_node?(evaluator)} && @next_mover_mark == evaluator
    # return true if self.children.any? {|child| child.losing_node?(evaluator)} && @next_mover_mark != evaluator
    # false

    if @next_mover_mark == evaluator
      self.children.all? {|child| child.losing_node?(evaluator)}
    else
      self.children.any? {|child| child.losing_node?(evaluator)}
    end

  end

  def winning_node?(evaluator)
    return false if @board.over? && (@board.winner == nil || @board.winner != evaluator)
    return true if @board.over? && @board.winner == evaluator

    if @next_mover_mark == evaluator
      self.children.any? {|child| child.winning_node?(evaluator)}
    else
      self.children.all? {|child| child.winning_node?(evaluator)}
    end
    # self.children.any? {|child| child.winning_node?(evaluator)} && @next_mover_mark == evaluator
    # self.children.all? {|child| child.winning_node?(evaluator)} && @next_mover_mark != evaluator
    # false
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children_arr = []
    if @next_mover_mark == :x
      updated_mover_mark = :o
    else
      updated_mover_mark = :x
    end
    (0..2).each do |row|
      (0..2).each do |col| 
        if @board.empty?([row,col])
          pos = [row,col]
          new_board = @board.dup
          new_board[pos] = @next_mover_mark
          children_arr << TicTacToeNode.new(new_board, updated_mover_mark,pos)
        end
      end
    end
    children_arr
  end
end
