# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagnol One
  [6,4,2], #Diagnol Two
]

def won?(board)
  #this tests to see if the board has any winning combos
  final_decision = false
  winning_combo=[]
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board,win_combination[0])

    final_decision = true
    winning_combo = win_combination
    else
    end
  end

  if final_decision
    return winning_combo
  else
    return final_decision
  end

end

def full?(board)
  #Seeing if the board is full or not
board.all? { |position|
  !(position.nil? || position == " ")
}
end

def draw?(board)
  #Tests if the board is in a draw state by seing if it is full and not won
  if full?(board) & !(won?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  #This shcekc to see if there is a winner and if so it returns who that winner is
  if over?(board)
    #first check to see if the game is over
    if draw?(board)
      # if it is over see if the game is in a draw or not
      return nil
    else
      #If the game is over and not in a draw than check to find the winning letter
      winning_combo = won?(board)
      board[winning_combo[0]]
    end
  else
    return nil
  end
end
