class Board

  @@X_SYMBOL = "X"
  def self.X_SYMBOL
    return @@X_SYMBOL
  end
  @@O_SYMBOL = "O"
  def self.O_SYMBOL
    return @@O_SYMBOL
  end

  def initialize
    make_board()
  end

  def print_board
    @board.each { |row|
      puts "#{row[0]}|#{row[1]}|#{row[2]}"
    }
  end

  def reset_board
    position = 1
    @board.each { |row|
      (0..2).each { |column|
        row[column] = position
        position += 1
      }
    }
  end

  # Adds move to board. If space is already taken method returns false
  def make_move(symbol, row, column)
    if(symbol != @@X_SYMBOL && symbol != @@O_SYMBOL)
      raise ArgumentError, "symbol must either be an X or an O"
    end

    if(@board[row][column] != @@X_SYMBOL && @board[row][column] != @@O_SYMBOL)
      @board[row][column] = symbol
      return true
    end
    return false
  end

  def win?
    return (check_row_for_win || check_column_for_win || check_diagonal_for_win)
  end

  def free_space_on_board?
    result = false
    @board.each{ |row|
      if(row.any? { |input| input != @@X_SYMBOL && input != @@O_SYMBOL })
        result = true
        break
      end
    }

    return result
  end

  private

  def make_board
    @board = Array.new
    3.times { |a|
      @board.push([nil, nil, nil])
    }
    reset_board
  end

  def check_row_for_win()
    result = false
    @board.each{ |row|
      if(row.all? { |input| input == @@X_SYMBOL })
        result = true
        break
      end
      if(row.all? { |input| input == @@O_SYMBOL })
        result = true
        break
      end
    }

    return result
  end

  def check_column_for_win
     values_to_check = nil
      (0..2).each { |a|
        values_to_check = Array.new
        (0..2).each { |b|
          values_to_check.push(@board[b][a])
        }

        result = (values_to_check.all? { |input| input == @@X_SYMBOL } ||
          values_to_check.all? { |input| input == @@O_SYMBOL })
        if(result)
          return true
        end
      }
     return false
  end

  def check_diagonal_for_win
    values_to_check = [
      @board[0][0],
      @board[1][1],
      @board[2][2],
    ]
    if(values_to_check.all? { |input| input == @@X_SYMBOL } ||
        values_to_check.all? { |input| input == @@O_SYMBOL })
      return true
    end

    values_to_check = [
      @board[0][2],
      @board[1][1],
      @board[2][0],
    ]
    if(values_to_check.all? { |input| input == @@X_SYMBOL } ||
        values_to_check.all? { |input| input == @@O_SYMBOL })
      return true
    end

    return false
  end

end
