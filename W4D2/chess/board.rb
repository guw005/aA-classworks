require_relative "piece.rb"

class Board
  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.new(nil, nil, nil))}
    @grid[0][0] = SlidingPiece.new('black', [0, 0], :R)
    @grid[0][1] = SteppingPiece.new('black', [0, 1], :Kn)
    @grid[0][2] = SlidingPiece.new('black', [0, 2], :B)
    @grid[0][3] = SlidingPiece.new('black', [0, 3], :Q)
    @grid[0][4] = SteppingPiece.new('black', [0, 4], :K)
    @grid[0][5] = SlidingPiece.new('black', [0, 5], :B)
    @grid[0][6] = SteppingPiece.new('black', [0, 6], :Kn)
    @grid[0][7] = SlidingPiece.new('black', [0, 7], :R)

    (0..7).each do |i|
      @grid[1][i] = Pawn.new('black', [1, i], :P)
    end

    (0..7).each do |i|
      @grid[6][i] = Pawn.new('white', [6, i], :P)
    end

    @grid[-1][0] = SlidingPiece.new('white', [7, 0], :R)
    @grid[-1][1] = SteppingPiece.new('white', [7, 1], :Kn)
    @grid[-1][2] = SlidingPiece.new('white', [7, 2], :B)
    @grid[-1][3] = SlidingPiece.new('white', [7, 3], :Q)
    @grid[-1][4] = SteppingPiece.new('white', [7, 4], :K)
    @grid[-1][5] = SlidingPiece.new('white', [7, 5], :B)
    @grid[-1][6] = SteppingPiece.new('white', [7, 6], :Kn)
    @grid[-1][7] = SlidingPiece.new('white', [7, 7], :R)

  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row,col = pos
    @grid[row][col] = val
  end
  
  def move_piece(color, start_pos, end_pos)
  end

  def valid_pos?(pos)
  end

  def add_piece(piece, pos)
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end
  
  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end
end