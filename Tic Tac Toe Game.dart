import 'dart:io';

void main() {
  print('Welcome to Tic-Tac-Toe!');

  while (true) {
    // Initialize the game board
    List<String> board = List.generate(9, (index) => (index + 1).toString());

    // Initialize players
    String player1 = 'X';
    String player2 = 'O';
    String currentPlayer = player1;

    // Display the initial board
    displayBoard(board);

    // Game loop
    while (true) {
      // Player makes a move
      int move = getPlayerMove(currentPlayer, board);

      // Update the board
      board[move - 1] = currentPlayer;

      // Display the updated board
      displayBoard(board);

      // Check for a winner
      if (checkForWinner(board, currentPlayer)) {
        print('Player $currentPlayer wins!');
        break;
      }

      // Check for a draw
      if (board.every((cell) => cell == 'X' || cell == 'O')) {
        print('It\'s a draw!');
        break;
      }

      // Switch players
      currentPlayer = (currentPlayer == player1) ? player2 : player1;
    }

    // Ask if the players want to play again
    print('Do you want to play again? (y/n)');
    String playAgain = stdin.readLineSync()!.toLowerCase();

    if (playAgain != 'y') {
      print('Thanks for playing. Goodbye!');
      break;
    }
  }
}

void displayBoard(List<String> board) {
  print(' ${board[0]} | ${board[1]} | ${board[2]} ');
  print('-----------');
  print(' ${board[3]} | ${board[4]} | ${board[5]} ');
  print('-----------');
  print(' ${board[6]} | ${board[7]} | ${board[8]} ');
}

int getPlayerMove(String player, List<String> board) {
  while (true) {
    print('Player $player, enter your move (1-9):');
    int move = int.parse(stdin.readLineSync()!);

    if (move >= 1 && move <= 9 && board[move - 1] == move.toString()) {
      return move;
    } else {
      print('Invalid move. Please try again.');
    }
  }
}

bool checkForWinner(List<String> board, String player) {
  // Check rows
  for (int i = 0; i < 3; i++) {
    if (board[i * 3] == player &&
        board[i * 3 + 1] == player &&
        board[i * 3 + 2] == player) {
      return true;
    }
  }

  // Check columns
  for (int i = 0; i < 3; i++) {
    if (board[i] == player && board[i + 3] == player && board[i + 6] == player) {
      return true;
    }
  }

  // Check diagonals
  if (board[0] == player && board[4] == player && board[8] == player) {
    return true;
  }
  if (board[2] == player && board[4] == player && board[6] == player) {
    return true;
  }

  return false;
}
