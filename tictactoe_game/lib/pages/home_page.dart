import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_game/generated/l10n.dart';
import 'package:tictactoe_game/viewModel/home_page_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: _buildScoreBoard(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Consumer<HomePageViewModel>(
            builder: (context, viewModel, _) {
              return GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      viewModel.tapped(context, index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700),
                      ),
                      child: Center(
                        child: Text(
                          viewModel.displayExOh[index],
                          style: const TextStyle(
                            fontSize: 40,
                            fontFamily: "Minecraft",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        const Expanded(
          child: Center(
            child: Column(
              children: [
                Text(
                  "T I C  T A C  T O E",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Minecraft",
                      color: Colors.white),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "@ i b r a h i m . y t z",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Minecraft",
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScoreBoard() {
    return Consumer<HomePageViewModel>(
      builder: (context, viewModel, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildPlayerScore(S.of(context).player, viewModel.exScore),
            _buildPlayerScore(S.of(context).playerTwo, viewModel.ohScore),
          ],
        );
      },
    );
  }

  Widget _buildPlayerScore(String playerName, int score) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          playerName,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: "Minecraft",
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          score.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontFamily: "Minecraft",
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
