class Piece
  def initialize(color, pos, symbol)
    @color = color
    @pos = pos
    @symbol = symbol
  end
end

class Pawn < Piece
end

class SteppingPiece < Piece
end

class SlidingPiece < Piece
end

class NullPiece < Piece
end