import 'package:flutter/material.dart';
import 'package:tictactoe_game/generated/l10n.dart';

class HomePageViewModel extends ChangeNotifier {
  int ohScore = 0;
  int exScore = 0;
  bool ohTurn = true; // the first player is "o";
  int filledBoxes = 0;
  List<String> displayExOh = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  void tapped(BuildContext context, int index) {
    if (ohTurn && displayExOh[index] == "") {
      displayExOh[index] = "o";
      filledBoxes += 1;
      ohTurn = !ohTurn;
    } else if (!ohTurn && displayExOh[index] == "") {
      displayExOh[index] = "x";
      filledBoxes += 1;
      ohTurn = !ohTurn;
    }
    _checkWinner(context);
    notifyListeners();
  }

  void _checkWinner(BuildContext context) {
    // 1.row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != "") {
      _showWinDialog(context, displayExOh[0]);
    }
    // 2.row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != "") {
      _showWinDialog(context, displayExOh[3]);
    }
    // 3.row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != "") {
      _showWinDialog(context, displayExOh[6]);
    }
    // 1.column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != "") {
      _showWinDialog(context, displayExOh[0]);
    }
    // 2.column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != "") {
      _showWinDialog(context, displayExOh[1]);
    }
    // 3.column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != "") {
      _showWinDialog(context, displayExOh[2]);
    }
    // 1.çapraz
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != "") {
      _showWinDialog(context, displayExOh[0]);
    }
    // 2.çapraz
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != "") {
      _showWinDialog(context, displayExOh[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog(context);
    }
  }

  void _showDrawDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            S.of(context).draw,
            style: const TextStyle(
                fontSize: 20,
                fontFamily: "Minecraft",
                color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).pAgain,
                style: const TextStyle(
                    fontSize: 15, fontFamily: "Minecraft", color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showWinDialog(BuildContext context, String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            " ${S.of(context).winner}  :  $winner",
            style: const TextStyle(
                fontSize: 20,
                fontFamily: "Minecraft",
                color: Colors.black,
                fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: Text(
                S.of(context).pAgain,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: "Minecraft",
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
    if (winner == "o") {
      ohScore += 1;
    } else if (winner == "x") {
      exScore += 1;
    }
    _clearBoard();
  }

  void _clearBoard() {
    for (int i = 0; i < 9; i++) {
      displayExOh[i] = "";
    }
    notifyListeners();
    filledBoxes = 0;
  }
}
