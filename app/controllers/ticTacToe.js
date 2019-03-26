const board = [["X", "X", "X"], ["", "", ""], ["", "", ""]];
const board2 = [["", "X", ""], ["", "X", ""], ["", "X", ""]];
const board3 = [["X", "", ""], ["", "X", ""], ["", "", "X"]];
function ticTacToeWinner(arr) {
  function horizontalMatch(arr) {
    for (let i = 0; i < arr.length; i++) {
      if (arr[i][0] == arr[i][1] && arr[i][1] == arr[i][2]) {
        console.log(`The winner is ${arr[i][0]}`);
        return true;
      }
    }
  }
  horizontalMatch(arr);
  function verticalMatch(arr) {
    for (let i = 0; i < arr.length; i++) {
      if (arr[0][i] == arr[1][i] && arr[1][i] == arr[2][i] && arr[0][i] != "") {
        // console.log(i);
        console.log(`The winner is ${arr[0][i]}`);
        return true;
      }
    }
  }
  verticalMatch(arr);
  function diagonalMatch(arr) {
    if ((arr[0][0] == arr[1][1]) == arr[2][2] && arr[0][0] != "") {
      console.log(`The winner is ${arr[0][0]}`);
      return true;
    } else if ((arr[0][2] == arr[1][1]) == arr[2][0] && arr[0][2] != "") {
      console.log(`The winner is ${arr[0][0]}`);
      return true;
    }
  }
  diagonalMatch(arr);
}
ticTacToeWinner(board);
ticTacToeWinner(board2);
ticTacToeWinner(board3);
